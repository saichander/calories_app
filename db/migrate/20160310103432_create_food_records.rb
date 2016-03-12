class CreateFoodRecords < ActiveRecord::Migration
  def change
    create_table :food_records do |t|
      t.float :quantity
      t.integer :calculated_calories
      t.date :intake_date

      t.timestamps null: false
    end
  end
end
