class BodyMetricsController < ApplicationController
  def new
    @user_body_metric = current_user.build_body_metric
  end

  def create
    @user_body_metric = current_user.build_body_metric
    @user_body_metric = current_user.build_body_metric(body_metric_params)
    if  @user_body_metric.save
      flash[:info] = "calculated"
      redirect_to user_body_metric_path(current_user.id,@user_body_metric.id)
    else
      render 'new'
    end
  end

  def show
    @body_metric = BodyMetric.find_by(user_id: current_user.id)
    render 'show'
  end

  def edit
    @user_body_metric_edit = BodyMetric.find_by(user_id: current_user.id)
  end

  def update
    @user_body_metric_edit = BodyMetric.find_by(user_id: current_user.id)
    @user_body_metric_edit.update_attributes(body_metric_params)
    flash[:updated] = "Updated Successfully"
    redirect_to user_body_metric_path(current_user.id,@user_body_metric_edit.id)
  end

  private

  def body_metric_params
    params.require(:body_metric).permit(:user_id, :height, :weight, :activity_level)
  end
end
