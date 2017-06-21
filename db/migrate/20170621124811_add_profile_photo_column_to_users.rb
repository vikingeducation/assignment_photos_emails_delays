class AddProfilePhotoColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profile_photo, :binary, limit: 10.megabyte
    add_column :users, :filename, :string
    add_column :users, :mime_type, :string
  end
end
