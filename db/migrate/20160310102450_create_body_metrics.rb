class CreateBodyMetrics < ActiveRecord::Migration
  def change
    create_table :body_metrics do |t|
      t.integer :height
      t.integer :weight
      t.float :activity_level
      t.integer :calories_required

      t.timestamps null: false
    end
  end
end
