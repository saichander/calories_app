class BodyMetric < ActiveRecord::Base
  belongs_to :user
  after_create :calc_calories

  validates :height, presence: true, numericality: {only_integer: true} if !:height.blank?
  validates :weight, presence: true, numericality: {only_integer: true}
  validates :activity_level, inclusion: [1.2,1.375,1.55,1.725,1.9]


  def calc_calories
    @body_metric = BodyMetric.find_by(user_id: user_id)
     @user = User.find_by(id: user_id)
    @age =  (Date.today-@user.dob).to_i / 365
      if @user.gender = "male"
        @calories = (66+(13.7*@body_metric.weight)+(5*@body_metric.height)-(6.8*@age))*@body_metric.activity_level
      else
        @calories = (655+(9.6*@body_metric.weight)+(1.8*@body_metric.height)-(4.7*@age))*@body_metric.activity_level
      end
    @body_metric.update_attributes(calories_required: @calories)
  end
end
