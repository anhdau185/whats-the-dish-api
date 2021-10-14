class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :title
      t.string :description
      t.text :images, array: true, default: []
      t.text :places, array: true, default: []
      t.integer :likeCount, default: 0
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
