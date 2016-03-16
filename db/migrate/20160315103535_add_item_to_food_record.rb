class AddItemToFoodRecord < ActiveRecord::Migration
  def change
    add_column :food_records, :item, :string
  end
end
