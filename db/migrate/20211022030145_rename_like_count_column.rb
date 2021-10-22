class RenameLikeCountColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :dishes, :likeCount, :like_count
  end
end
