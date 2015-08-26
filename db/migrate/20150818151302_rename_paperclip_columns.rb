class RenamePaperclipColumns < ActiveRecord::Migration
  def change
    rename_column :users, :avatar_file_name, :profile_photo_file_name
    rename_column :users, :avatar_content_type, :profile_photo_content_type
    rename_column :users, :avatar_file_size, :profile_photo_file_size
    rename_column :users, :avatar_updated_at, :profile_photo_updated_at
  end
end
