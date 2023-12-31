class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0.0 }

  def name_with_measurement_unit
    "#{name} (#{measurement_unit})"
  end
end
