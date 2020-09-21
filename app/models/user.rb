class User < ActiveRecord::Base
  has_secure_password
  
  validates :email, :first_name, :last_name, presence: true
  validates :password, length: { minimum: 8 }, confirmation: true
  validates :password_confirmation, presence: true 
  validates :email, uniqueness: { case_sensitive: false }
end
