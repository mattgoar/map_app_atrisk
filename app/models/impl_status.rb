class ImplStatus < ActiveRecord::Base
  validates :status_name, :presence => true, :uniqueness => true
  validates :last_edited_by, :presence => true

  has_many :client_onboarding_statuses , :class_name => "ClientOnboardingStatus", :foreign_key => "impl_status_id"

end
