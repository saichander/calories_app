class BodyMetricsController < ApplicationController
  def new
    @user_body_metric = current_user.build_body_metric
  end

  def create
    @body_metric = current_user.build_body_metric(body_metric_params)
    @body_metric.save
    flash[:info] = "calculated"
    redirect_to user_body_metric_path(current_user.id,@body_metric.id)
  end

  def show
    @body_metric = BodyMetric.find_by(user_id: current_user.id)
    render 'show'
  end

  private

    def body_metric_params
      params.require(:body_metric).permit(:user_id, :height, :weight, :activity_level)
    end
end
