class RestaurantsController < ApplicationController

  def index
    @results = params[:q]

    if @results == nil
    else
      @results
end

yelp_api_key = "mY9ou23owK6ViN4MQnkI1o-z7ksAicUDyV4Q_0Dq2Qm829nDuxlPrTQo-Vc5kU9jZlmdmoJ7p4o3Mabc9BYxPVpIKv3PnOfyCzU4S7r2SdxuJ4bE612sNNj4BEBvW3Yx"

http = Curl.get("https://api.yelp.com/v3/businesses/search?&term=#{@results}&location=New+York") do |http|

  http.headers["Authorization"] = "Bearer #{yelp_api_key}"



end
@r = JSON.parse(http.body_str)


@r["businesses"].each do |r|
 r["image_url"]
 r["name"]
  r['categories'][0]['title']
 r["price"]
 r["location"]["display_address"]
 r["display_phone"]
 r["rating"]
 r["image_url"]
 @restaurant = Restaurant.new(
  :name => r['name'], #so this will save api data and eliminate the punctuation
                                                  #unfortunatley I still have top query data the same way its saved in the database
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


def new
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.new
end


def show
  @review = Review.new
  @restaurant = Restaurant.find(params[:id])
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



private

def review_params
  params.require(:review).permit(:title, :clientele, :management, :team, :more_details, :shift_description, :rating)
end
# def res_params
#   params.require(:restaurant).permit(:name, :res_type, :address, :phone_number, :price_range, :hours)
#   end


end
