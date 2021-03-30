class RemoveColumnFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :author_id, :integer
  end
end
