class ChangeDataImagePosts < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :image, :string
  end
end
