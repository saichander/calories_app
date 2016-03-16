class FoodRecord < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  after_create :compute_calories

  def compute_calories
    @food_record = User.find_by(id: user_id).food_records.last
    if @food_record.calculated_calories.nil?
      @item = FoodItem.find_by(item: @food_record.item)
      @calories_intake = @item.calories*@food_record.quantity
      @food_record.update_attributes(calculated_calories: @calories_intake)
    end
  end
end
