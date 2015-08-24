class Client < ActiveRecord::Base
  validates :clientname, :presence => true, :uniqueness => true
  validates :last_edited_by, :presence => true

  has_many :client_onboarding_statuses , :class_name => "ClientOnboardingStatus", :foreign_key => "client_id"
  has_many :data_statuses , :class_name => "DataStatus", :foreign_key => "client_id"
  has_many :client_informations , :class_name => "ClientInformation", :foreign_key => "client_id"

end
