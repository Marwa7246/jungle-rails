class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com',
  return_path: 'no-reply@jungle.com'

  
  def welcome_email(user)
    @user = user
    @url=ENV["URL"]
    mail(to: @user.email, subject: 'Welcome to Jungle Site')
  end

end
