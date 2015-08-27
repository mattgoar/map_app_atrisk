class Client < ActiveRecord::Base
  validates :clientname, :presence => true, :uniqueness => true
  validates :last_edited_by, :presence => true

  has_many :client_onboarding_statuses , :class_name => "ClientOnboardingStatus", :foreign_key => "client_id"
  has_many :data_statuses , :class_name => "DataStatus", :foreign_key => "client_id"
  has_many :client_informations , :class_name => "ClientInformation", :foreign_key => "client_id"

  def self.create_assoc_data(target_client_id, current_user_id)
    if ClientInformation.find_by(client_id: target_client_id).nil?
      then ClientInformation.create_default(target_client_id, current_user_id)
      else
    end

    if ClientOnboardingStatus.find_by(client_id: target_client_id).nil?
      then ClientOnboardingStatus.create_default(target_client_id, current_user_id)
      else
    end

    if DataStatus.find_by(client_id: target_client_id).nil?
      then DataStatus.create_default(target_client_id, current_user_id)
      else
    end

    if Atrisk.find_by(client_id: target_client_id).nil?
      then Atrisk.create_default(target_client_id)
      else
    end
  end

  def self.check_assoc_data(current_user_id)
    Client.find_each do |client|
      if ClientInformation.find_by(client_id: client.id).nil?
        then ClientInformation.create_default(client.id current_user_id)
        else
      end

      if ClientOnboardingStatus.find_by(client_id: client.id).nil?
        then ClientOnboardingStatus.create_default(client.id, current_user_id)
        else
      end

      if DataStatus.find_by(client_id: client.id).nil?
        then DataStatus.create_default(client.id, current_user_id)
        else
      end

      if Atrisk.find_by(client_id: client.id).nil?
        then Atrisk.create_default(client.id)
        else
      end
    end
  end

end
