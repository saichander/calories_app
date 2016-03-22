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
    @food_list = current_user.food_records.where(intake_date: Date.today)
  end

  def edit
    @user_food_record_edit = FoodRecord.find_by(id: params[:id])
  end

  def update
    @user_food_record_edit = FoodRecord.find_by(id: params[:id])
    @user_food_record_edit.update_attributes(food_record_params)
    redirect_to  user_food_record_path(current_user.id,@user_food_record_edit.id)
  end

  private

  def food_record_params
    params.require(:food_record).permit(:item, :quantity, :intake_date, :calculated_calories)
  end
end
