class FoodRecord < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_one :body_metric
end
