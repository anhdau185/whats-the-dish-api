class RemoveCategoryFromDish < ActiveRecord::Migration[6.1]
  def change
    remove_reference :dishes, :category, null: false, foreign_key: true
  end
end
