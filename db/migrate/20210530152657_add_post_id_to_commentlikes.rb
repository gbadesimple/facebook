class AddPostIdToCommentlikes < ActiveRecord::Migration[6.1]
  def change
    add_column :commentlikes, :post_id, :integer
  end
end
