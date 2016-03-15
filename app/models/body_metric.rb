class BodyMetric < ActiveRecord::Base
  belongs_to :user
  after_create :calc_calories

  def calc_calories
    @body_metric = BodyMetric.find_by(user_id: user_id)
    @calories = (655+(9.6*@body_metric.weight)+(1.8*@body_metric.height))*@body_metric.activity_level
    @body_metric.update_attributes(calories_required: @calories)
  end
end
