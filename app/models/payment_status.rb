class PaymentStatus < ActiveRecord::Base
  validates :status_name, :presence => true, :uniqueness => true
  validates :last_edited_by, :presence => true
end
