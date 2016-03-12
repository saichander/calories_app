class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :item
      t.float :quantity
      t.string :metrics
      t.integer :calories

      t.timestamps null: false
    end
  end
end
