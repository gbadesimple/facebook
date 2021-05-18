class AddImagesToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :images, :string
  end
end
