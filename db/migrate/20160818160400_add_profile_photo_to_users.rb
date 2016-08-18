class AddProfilePhotoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_photo, :binary
    add_column :users, :mime_type, :string
    add_column :users, :file_name, :string
  end
end
