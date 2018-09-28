class AddRoleToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :role, :string
  end
end
