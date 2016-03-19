class FoodItemsController < ApplicationController
  def index
    @food_item = FoodItem.new
    @food_items_list = FoodItem.all
  end

  def create
    @food_item = FoodItem.create(food_item_params)
    if @food_item.save
      flash.now[:success] = "done"
      redirect_to food_items_path
    else
      @food_items_list = FoodItem.all
      render 'index'
    end
  end

  def new
  end

  private

  def food_item_params
    params.require(:food_item).permit(:item, :quantity, :metrics, :calories)
  end
end
