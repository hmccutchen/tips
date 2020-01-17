class CreateReviewsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reviews do |t|
      t.references :review, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
