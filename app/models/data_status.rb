class DataStatus < ActiveRecord::Base

  validates :last_edited_by, :presence => true
  validates :months_late, :presence => true
  validates :db_type, :presence => true
  validates :month, :presence => true
  validates :year, :presence => true
  validates :client_id, :presence => true

  belongs_to :client , :class_name => "Client", :foreign_key => "client_id"
  belongs_to :user, :class_name => "User", :foreign_key => "last_edited_by"


  def self.import(file, user_id)
    CSV.foreach(file.path, headers: true) do |row|
      data = row.to_hash
      data[:last_edited_by] = user_id
      DataStatus.create! data
    end
  end

  def self.create_default(client_id, current_user_id)
    DataStatus.create!([{
      last_edited_by: current_user_id,
      months_late: 0,
      db_type: 'None',
      month: 0,
      year: 0,
      client_id: client_id
      }])
  end

end
