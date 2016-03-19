class FoodItem < ActiveRecord::Base
  validates :item, presence: true, uniqueness: true
  validates :quantity,presence: true, numericality: {only_integer: true}
  validates :metrics, presence: true
  validates :calories, presence: true, numericality: {only_integer:true}
end
