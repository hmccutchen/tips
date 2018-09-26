class RestaurantsController < ApplicationController


  API_KEY = "mY9ou23owK6ViN4MQnkI1o-z7ksAicUDyV4Q_0Dq2Qm829nDuxlPrTQo-Vc5kU9jZlmdmoJ7p4o3Mabc9BYxPVpIKv3PnOfyCzU4S7r2SdxuJ4bE612sNNj4BEBvW3Yx"


  def index
    @results = params[:q]



http = Curl.get("https://api.yelp.com/v3/businesses/search?&term=#{@results}&location=New+York") do |http|
  http.headers["Authorization"] = "Bearer #{API_KEY}"
end
@r = JSON.parse(http.body_str)
p @r

@r["businesses"].each do |r|
 r["image_url"]
 r["name"]
 r["categories"][0]["title"]
 r["price"]
 r["location"]["display_address"]
 r["display_phone"]
 r["rating"]
p r["image_url"]
 @restaurant = Restaurant.new(
  :name => r['name'],
  :picture => r["image_url"],
  :address => r['location']['display_address'],
  :res_type => r['categories'][0]['title'],
  :phone_number => r['display_phone'],
  :price_range => r['price'],
  :hours => r['hours']
  )

 if @restaurant.save
  p "saved"
else
  p "not saved"
end

end
@restaurants = Restaurant.where(Restaurant.arel_table[:name].lower.matches("%#{@results}%"))

end

def search; end





def new
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.new
end


def show

  p session[:user_id]

  @review = Review.new
  @restaurant = Restaurant.find(params[:id])
  # @call = params[:id]
  # http = Curl.get("https://api.yelp.com/v3/businesses/#{@call}") do |http|
  #   http.headers["Authorization"] = "Bearer #{API_KEY}"
  # end
  # @c = JSON.parse(http.body_str)

 #  @restaurant = Restaurant.new(
 #    :name => @c['name'],
 #    :address => @c['location']['display_address'],
 #    :phone_number => @c['display_phone'],
 #    :price_range => @c['price'],
 #    :hours => @c['hours'][0]['open'][1]['start']
 #    )
 #  if @restaurant.save

 #   p @restaurant
 # else
 #  render "show"
 #  p "did not save"
# end
end


def create
  @restaurant = Restaurant.find(params[:restaurant_id])

  @review = @restaurant.reviews.new(review_params)
respond_to do |format|
  if @review.save!


  else
    render 'show'
  end
  end
end




def edit
end




private

def review_params
  params.require(:review).permit(:title, :clientele, :management, :team, :more_details, :shift_description, :rating)
end
# def res_params
#   params.require(:restaurant).permit(:name, :res_type, :address, :phone_number, :price_range, :hours)
#   end


end
