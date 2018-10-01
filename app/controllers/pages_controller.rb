class PagesController < ApplicationController





  def home
    @reviews = Review.all

  @user = current_user
  end


def like
  @user = current_user
p @user
@review = Review.find(params[:id])
   @review.liked_by @user
  redirect_to '/'
end

def dislike
  @user = current_user

@review = Review.find(params[:id])
  @notip = @review.downvote_from @user
  redirect_to '/'

end

def undislike
@user = current_user

@review = Review.find(params[:id])
   @review.undisliked_by @user
  redirect_to '/'

end

def unlike
  @user = current_user

@review = Review.find(params[:id])
   @review.unliked_by @user
  redirect_to '/'

end






end
