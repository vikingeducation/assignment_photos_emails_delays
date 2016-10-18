class RemoveUnusedProfilePhotoColumnsFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :profile_photo_data
    remove_column :users, :profile_photo_filename
    remove_column :users, :profile_photo_mime_type
  end

  def down
    add_column :users, :profile_photo_data, :binary, :limit => 10.megabytes
    add_column :users, :profile_photo_filename, :string
    add_column :users, :profile_photo_mime_type, :string
  end
end
