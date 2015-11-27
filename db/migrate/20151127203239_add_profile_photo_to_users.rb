class AddProfilePhotoToUsers < ActiveRecord::Migration
  def up
    add_column :users, :profile_photo_data, :binary, :limit => 10.megabytes
    add_column :users, :profile_photo_filename, :string
    add_column :users, :profile_photo_mime_type, :string
  end

  def down
    remove_column :users, :profile_photo_data
    remove_column :users, :profile_photo_filename
    remove_column :users, :profile_photo_mime_type
  end
end
