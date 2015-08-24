class PaymentStatus < ActiveRecord::Base
  validates :status_name, :presence => true, :uniqueness => true
  validates :last_edited_by, :presence => true

  has_many :client_informations , :class_name => "ClientInformation", :foreign_key => "payment_status_id"
end
