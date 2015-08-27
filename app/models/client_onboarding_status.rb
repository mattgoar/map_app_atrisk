class ClientOnboardingStatus < ActiveRecord::Base

  validates :last_edited_by, :presence => true
  validates :impl_status_id, :presence => true
  validates :client_id, :presence => true

  belongs_to :impl_status
  belongs_to :client , :class_name => "Client", :foreign_key => "client_id"
  belongs_to :user, :class_name => "User", :foreign_key => "last_edited_by"

  def self.create_default(client_id, current_user_id)
    ClientOnboardingStatus.create!([{
      last_edited_by: current_user_id,
      notes: "None",
      impl_status_id: 1,
      certification_date: "1900-01-01",
      kickoff_date: "1900-01-01",
      client_id: client_id
      }])
    end

end
