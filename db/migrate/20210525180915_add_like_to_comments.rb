class AddLikeToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :like_id, :integer
  end
end
