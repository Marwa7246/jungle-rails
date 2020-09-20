class SessionsController < ApplicationController
  
  def new
  end

  # Save the user id inside the browser cookie.  

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      @error_login='Invalid Username/password!'
      render :new, alert: @error_login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
