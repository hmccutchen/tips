

json.reviews @reviews.each do |review|
   json.id review.id
   json.restaurant review.restaurant
   json.title review.title
   json.tip_avg review.tip_avg
   json.clientele review.clientele
   json.management review.management
   json.team review.team
   json.role review.role
   json.rating review.rating
   json.voted_up @user.voted_up_on? review
   json.voted_down @user.voted_down_on? review
puts "this is the home page json stuff"
   json.likes review.get_likes.size
  json.user_voted @user.voted_for? review
end