
json.id @review.id
json.title @review.title
json.user_voted @review.unliked_by @user
json.voted_down @user.voted_down_on? @review
puts "yygygygygygygygygygygygygygygygygygy unlikeyygygygygyg"
puts json.voted_up @user.voted_up_on? @review




