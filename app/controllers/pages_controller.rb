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




def unlike
  @user = current_user

@review = Review.find(params[:id])
   @review.unliked_by @user
  redirect_to '/'

end

def show
@review = Review.find(params[:id])

end



# not sure I want to use a dislike button but If I do these are the methods already built and working for them.

# def dislike
#   @user = current_user

# @review = Review.find(params[:id])
#   @notip = @review.downvote_from @user
#   redirect_to '/'

# end

# def undislike
# @user = current_user

# @review = Review.find(params[:id])
#    @review.undisliked_by @user
#   redirect_to '/'

# end







end
