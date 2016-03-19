class WorkoutsController < ApplicationController

  def new
    @workout = Workout.new
  end
  def create
    @workout = Workout.create(workout_params)
    if @workout.save
      redirect_to workouts_path
    else
      render 'new'
    end
  end

  def index
    @workout = Workout.new
    @workout = Workout.all
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :video)
  end
end
