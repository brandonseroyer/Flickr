class RemovePhotoIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :photo_id, :integer
    add_column :comments, :post_id, :integer
  end
end
