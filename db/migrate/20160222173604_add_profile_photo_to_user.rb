class AddProfilePhotoToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_photo_data, :binary, :limit => 10.megabyte
    add_column :users, :profile_photo_filename, :string
    add_column :users, :profile_photo_mime_type, :string
  end
end
