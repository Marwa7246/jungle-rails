class User < ActiveRecord::Base
  has_secure_password
  validates :email, :first_name, :last_name, :password, presence: true
  validates :email, uniqueness: true
 

end
