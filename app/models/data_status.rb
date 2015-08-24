class DataStatus < ActiveRecord::Base

  validates :last_edited_by, :presence => true
  validates :months_late, :presence => true
  validates :db_type, :presence => true
  validates :month, :presence => true
  validates :year, :presence => true
  validates :client_id, :presence => true

  belongs_to :client , :class_name => "Client", :foreign_key => "client_id"
end
