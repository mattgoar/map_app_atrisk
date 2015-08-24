class SalesRep < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :last_edited_by, :presence => true

  has_many :client_informations , :class_name => "ClientInformation", :foreign_key => "sales_rep_id"
end
