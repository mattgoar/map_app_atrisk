class DataStatus < ActiveRecord::Base

  validates :last_edited_by, :presence => true
  validates :months_late, :presence => true
  validates :db_type, :presence => true
  validates :month, :presence => true
  validates :year, :presence => true
  validates :client_id, :presence => true

  belongs_to :client , :class_name => "Client", :foreign_key => "client_id"

  def self.import(file, user_id)
    CSV.foreach(file.path, headers: true) do |row|
      data = row.to_hash
      data[:last_edited_by] = user_id
      DataStatus.create! data
    end
  end
end
