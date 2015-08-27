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

end
