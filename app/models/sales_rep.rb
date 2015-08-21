class SalesRep < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :last_edited_by, :presence => true
end
