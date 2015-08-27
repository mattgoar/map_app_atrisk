class ClientInformation < ActiveRecord::Base
  validates :client_id, :presence => true
  validates :last_edited_by, :presence => true

  belongs_to :payment_status , :class_name => "PaymentStatus", :foreign_key => "payment_status_id"
  belongs_to :sales_rep
  belongs_to :client , :class_name => "Client", :foreign_key => "client_id"
  belongs_to :user, :class_name => "User", :foreign_key => "last_edited_by"
  belongs_to :atrisk, :class_name => "Atrisk", :foreign_key => "client_id"


end
