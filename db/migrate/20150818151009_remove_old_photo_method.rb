class RemoveOldPhotoMethod < ActiveRecord::Migration
  def change
    remove_column :users, :profile_photo
    remove_column :users, :filename
    remove_column :users, :mime_type
  end
end
