class DishSerializer < ActiveModel::Serializer
  attributes :id, :name, :title, :description, :images, :places, :likeCount
  belongs_to :category
end
