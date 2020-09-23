class UserMailer < ActionMailer::Base
 default(

   from: "<no-reply@jungle.com>",
   reply_to: "<no-reply@jungle.com>"

)

  
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Jungle Site')
  end

end
