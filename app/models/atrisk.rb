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
