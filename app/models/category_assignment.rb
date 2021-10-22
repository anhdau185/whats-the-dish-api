class CategoryAssignment < ApplicationRecord
  belongs_to :dish
  belongs_to :category
end
