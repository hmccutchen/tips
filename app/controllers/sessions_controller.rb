class SessionsController < ApplicationController





  def new

  end


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





end
