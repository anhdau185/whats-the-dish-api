class DishSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :title,
             :description,
             :images,
             :places,
             :likeCount,
             :created_at,
             :updated_at
  belongs_to :category
end
