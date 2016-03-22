class FoodItemsController < ApplicationController
  def new
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

  def index
    @food_item = FoodItem.new
    @food_items_list = FoodItem.all
  end

  def edit
    @food_item_edit = FoodItem.find_by(id: params[:id])
  end

  def update
    @food_item_edit = FoodItem.find(params[:id])
    byebug
    if @food_item_edit.update_attributes(food_item_params)
      redirect_to food_items_path
    else
      redirect_to edit_food_item_path(params[:id])
    end
  end
  private

  def food_item_params
    params.require(:food_item).permit(:item, :quantity, :metrics, :calories)
  end
end
