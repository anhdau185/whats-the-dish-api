class Dish < ApplicationRecord
  has_many :category_assignments, dependent: :destroy
  has_many :categories, through: :category_assignments
end
