class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews

  validates :email, :first_name, :last_name, presence: true
  validates :password, length: { minimum: 8 }, confirmation: true
  validates :password_confirmation, presence: true 
  validates :email, uniqueness: { case_sensitive: false }

  #####method to validate that the email and password are correct
  def self.authenticate_with_credentials(email, password)
    user = self.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      return user
    else
      nil
    end
  end
end
