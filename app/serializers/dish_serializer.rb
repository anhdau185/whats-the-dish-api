class DishSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :title,
             :description,
             :images,
             :places,
             :like_count,
             :created_at,
             :updated_at
  has_many :categories, through: :category_assignments
end
