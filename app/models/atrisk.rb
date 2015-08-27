class Atrisk < ActiveRecord::Base
  # validates :client_id, :presence => true
  # validates :exec_sponsor_status, :presence => true
  # validates :last_contact_status, :presence => true
  # validates :payment_status, :presence => true
  # validates :data_status, :presence => true
  # validates :implementation_status, :presence => true
  # validates :current_status, :presence => true
  # validates :current_reason, :presence => true

  has_many :client_informations , :class_name => "ClientInformation", :foreign_key => "client_id"

  def self.update(client_id)
    latest_atrisk_information = Atrisk.where(client_id: client_id).order('updated_at DESC').first

    at_risk_reasons = latest_atrisk_information.attributes.select { |k,v| v == "At-Risk"}.keys.join(", ").gsub('_',' ').gsub(' status','').titleize
    watch_reasons = latest_atrisk_information.attributes.select { |k,v| v == "Watch"}.keys.join(", ").gsub('_',' ').gsub(' status','').titleize

    if at_risk_reasons.length > 0 then
      latest_atrisk_information.current_status = '1. At-Risk'
      latest_atrisk_information.current_reason = at_risk_reasons
    elsif watch_reasons.length > 0 then
      latest_atrisk_information.current_status = '2. Watch'
      latest_atrisk_information.current_reason = watch_reasons
    else
      latest_atrisk_information.current_status = '3. Good Standing'
      latest_atrisk_information.current_reason = ''
    end
    latest_atrisk_information.save
  end

  def self.update_implementation(implementation_status)

    atrisk_update = Atrisk.where(client_id: implementation_status.client_id).order('updated_at DESC').first

    if implementation_status.updated_at >= atrisk_update.updated_at then

      atrisk_update = atrisk_update.dup

      #
      # Relevant updates
      #

      impl_days =
        if implementation_status.kickoff_date.nil?
          then 999
        else (Date.today - implementation_status.kickoff_date).to_i
        end
      atrisk_update.implementation_status =
      if implementation_status.impl_status.status_name == '1. Active'
        then
        if impl_days > 150
          then 'At-Risk'
        elsif impl_days > 90
          then 'Watch'
        else 'Good Standing'
        end
      else 'Good Standing'
      end

      atrisk_update.save
      Atrisk.update(implementation_status.client_id)

    else
    end

  end

  def self.update_client_information(client_information)
    atrisk_update = Atrisk.where(client_id: client_information.client_id).order('updated_at DESC').first

    if client_information.updated_at >= atrisk_update.updated_at then

       atrisk_update = atrisk_update.dup

      atrisk_update.exec_sponsor_status = if client_information.exec_sponsor != 'None' then 'Good Standing' else 'At-Risk' end
      days_since_contact =
        if client_information.last_contact_date.nil?
          then 999
        else (Date.today - client_information.last_contact_date).to_i
        end
      atrisk_update.last_contact_status = if days_since_contact >= 180 then 'At-Risk' elsif days_since_contact >= 90 then 'Watch' else 'Good Standing' end
      #
      # This is not a good way to do this
      # Fix me later
      #
      atrisk_update.payment_status =
      if client_information.payment_status.status_name == '5. Over 120 Days' then 'At-Risk'
      elsif client_information.payment_status.status_name == '4. 61 - 120 Days' then 'Watch'
      else 'Good Standing'
      end

      atrisk_update.save
      Atrisk.update(client_information.client_id)
    else
    end
  end

  def self.update_data_status()
    Client.find_each do |client|
      atrisk_update = Atrisk.where(client_id: client.id).order('updated_at DESC').first.dup
      atrisk_update.data_status =
        if client.data_statuses.order('updated_at DESC').first.months_late >= 4
          then 'At-Risk'
        elsif client.data_statuses.order('updated_at DESC').first.months_late >= 3
          then 'Watch'
        else 'Good Standing'
        end
      atrisk_update.save
      Atrisk.update(client.id)
    end
  end

  #
  # Set this to run every night
  #

  def self.update_all()
    Client.find_each do |client|
      Atrisk.update_implementation(client.client_onboarding_statuses.order('updated_at DESC').first)
      Atrisk.update_client_information(client.client_informations.order('updated_at DESC').first)
    end
    Atrisk.update_data_status()
  end

  def self.create_default(client_id)
    Atrisk.create!([{
      month: nil,
      year: nil,
      client_id: client_id,
      exec_sponsor_status: "Good Standing",
      last_contact_status: "Good Standing",
      payment_status: "Good Standing",
      data_status: "Good Standing",
      implementation_status: "Good Standing",
      current_status: "3. Good Standing",
      current_reason: ""
      }])
  end


end
