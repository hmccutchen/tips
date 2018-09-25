class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.integer :clientele
      t.integer :management
      t.integer :team
      t.text :shift_description
      t.string :tip_avg
      t.integer :rating
      t.text :more_details
      t.integer :restaurant_id


      t.timestamps
    end
  end
end
