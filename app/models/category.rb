class Category < ApplicationRecord
  has_many :category_assignments, dependent: :destroy
  has_many :dishes, through: :category_assignments

  validates :name, presence: true, length: { maximum: 50 }
end
