class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #validates :username, :presence => true, :uniqueness => true
  #validates :email, :presence => true, :uniqueness => true
  #validates :first_name, :presence => true
  #validates :last_name, :presence => true
  #validates :pretty_name, :presence => true
  #validates :last_edited_by, :presence => true
  #validates :active, :presence => true
  #validates :user_role_id, :presence => true
  #validates :user_password, :presence => true
end
