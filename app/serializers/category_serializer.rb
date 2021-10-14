class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :title, :description, :images
  has_many :dishes
end
