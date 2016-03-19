class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :video

      t.timestamps null: false
    end
  end
end
