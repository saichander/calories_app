class BodyMetricsController < ApplicationController
  def new
    @user_body_metric = current_user.build_body_metric
  end

  def create
    @body_metric = current_user.build_body_metric(body_metric_params)
    @body_metric.save
    flash[:info] = "calculated"
    byebug
    redirect_to user_body_metric_path(@body_metric.id, current_user.id)
  end

  def show
    byebug
    @body_metric = BodyMetric.find_by(user_id: current_user.id)
    render 'show'
  end

  private

    def body_metric_params
      params.require(:body_metric).permit(:user_id, :height, :weight, :activity_level)
    end
end
