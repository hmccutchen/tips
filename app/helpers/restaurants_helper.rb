module RestaurantsHelper
  def new_address_format(address)

     unless address.nil? || !address.start_with?("[")
      new_address = address.delete! "[]"
      new_address.gsub! /"/, ""
      new_address
     else
      address
    end
  end
end
