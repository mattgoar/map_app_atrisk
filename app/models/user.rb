class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :init

    def init
      self.user_role_id  ||= 100    #will set the default value only if it's nil
    end

  validates :email, :presence => true, :uniqueness => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  has_many :client_informations , :class_name => "ClientInformation", :foreign_key => "last_edited_by"
  has_many :client_onboarding_statuses , :class_name => "ClientOnboardingStatus", :foreign_key => "last_edited_by"
  has_many :data_statuses , :class_name => "DataStatus", :foreign_key => "last_edited_by"
end
