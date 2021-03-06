class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :picture
      t.string :address
      t.string :res_type
      t.string :phone_number
      t.string :price_range
      t.string :hours

      t.timestamps
    end
  end
end
