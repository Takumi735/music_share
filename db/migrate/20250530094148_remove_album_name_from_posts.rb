class RemoveAlbumNameFromPosts < ActiveRecord::Migration[7.2]
  def change
    remove_column :posts, :album_name, :string
  end
end
