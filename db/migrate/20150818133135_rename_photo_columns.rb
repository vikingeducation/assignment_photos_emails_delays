class RenamePhotoColumns < ActiveRecord::Migration
  def change
    rename_column :users, :user_photo, :profile_photo
  end
end
