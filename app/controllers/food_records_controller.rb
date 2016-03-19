class FoodRecordsController < ApplicationController
  def new
    @user_food_record = FoodRecord.new
    @food_list = FoodItem.all
  end

  def create
    @user_food_record = current_user.food_records.create(food_record_params)
    if @user_food_record.save
      redirect_to  user_food_record_path(current_user.id,@user_food_record.id)
    else
      render 'new'
    end
  end

  def show
    @food_record = current_user.food_records.last
    @food_list = FoodRecord.where(intake_date: Date.today)
  end

  private

  def food_record_params
    params.require(:food_record).permit(:item, :quantity, :intake_date)
  end
end
