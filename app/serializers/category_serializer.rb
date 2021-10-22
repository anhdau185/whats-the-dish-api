class CategorySerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :title,
             :description,
             :images,
             :created_at,
             :updated_at
  has_many :dishes, through: :category_assignments
end
