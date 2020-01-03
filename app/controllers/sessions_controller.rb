class SessionsController < ApplicationController


def create
 user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      p user

      redirect_to restaurants_path
    else
      msg = 'Invalid credentials'
      render 'new'
    end
end

def destroy
  session[:user_id] = nil
    log_out if logged_in?
    p 'Logged out successfully'
    redirect_to login_path
  end
end
