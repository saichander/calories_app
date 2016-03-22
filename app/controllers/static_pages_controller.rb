class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
    @food_record = current_user.food_records.last
    @food_list = current_user.food_records.where(intake_date: Date.today)
    end
  end
end
