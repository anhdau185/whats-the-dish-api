class CreateCategoryAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :category_assignments do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
