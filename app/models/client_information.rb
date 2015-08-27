class ClientInformation < ActiveRecord::Base
  validates :client_id, :presence => true
  validates :last_edited_by, :presence => true

  belongs_to :payment_status , :class_name => "PaymentStatus", :foreign_key => "payment_status_id"
  belongs_to :sales_rep
  belongs_to :client , :class_name => "Client", :foreign_key => "client_id"
  belongs_to :user, :class_name => "User", :foreign_key => "last_edited_by"
  belongs_to :atrisk, :class_name => "Atrisk", :foreign_key => "client_id"

  def self.create_default(client_id, current_user_id)
    ClientInformation.create!([{
      client_id: client_id,
      last_edited_by: current_user_id,
      last_contact_date: "",
      exec_sponsor: "None",
      termination_notice: "",
      payment_status_id: 1,
      balance: 0,
      reactivation_date: "",
      expiration_date: "",
      annual_fee: 0,
      sales_rep_id: 1,
      contract_type: "None"
    }])
  end


end
