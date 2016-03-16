class AddIdToFoodRecord < ActiveRecord::Migration
  def change
    add_column :food_records, :user_id, :integer
  end
end
