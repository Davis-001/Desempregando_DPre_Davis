class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :company
  has_many :applicants
  def profile
      p = ProfileUser.find_by(:user_id => self.id)
      Profile.find_by(:id => p.profile_id) 
  end
end
