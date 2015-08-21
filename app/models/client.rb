class Client < ActiveRecord::Base
  validates :clientname, :presence => true, :uniqueness => true
  validates :last_edited_by, :presence => true
end
