class ClientOnboardingStatus < ActiveRecord::Base

  validates :last_edited_by, :presence => true
  validates :notes, :presence => true
  validates :impl_status_id, :presence => true
  validates :certification_date, :presence => true
  validates :kickoff_date, :presence => true
  validates :client_id, :presence => true

  belongs_to :impl_status
  belongs_to :client , :class_name => "Client", :foreign_key => "client_id"
  belongs_to :user, :class_name => "User", :foreign_key => "last_edited_by"

end
