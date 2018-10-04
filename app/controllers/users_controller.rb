class UsersController < ApplicationController


  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
    if @user.save
    p @user
      redirect_to '/'
    else
      render 'new'
    end
  end


  def edit
    @user = User.find(params[:id])
  end



def show
  # @review.find(:review_id)
  @user = User.find(params[:id])
  @review = @user.reviews
  p @user
  p current_user
  if current_user != @user
    redirect_to '/'
  end
end






  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :position, :username, :email, :password)
  end
end
