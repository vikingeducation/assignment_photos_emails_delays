class MakeUsersUseFilesystem < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :profile_photo, :binary, limit: 3.megabytes
    remove_column :users, :filename, :string
    remove_column :users, :mime_type, :string
    add_column :users, :photo_path, :string
  end
end
