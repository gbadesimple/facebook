class AddLikeToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :like_id, :integer
  end
end
