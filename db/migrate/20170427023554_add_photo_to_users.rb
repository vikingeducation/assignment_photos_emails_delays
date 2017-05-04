class AddPhotoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profile_photo, :binary, limit: 3.megabytes
    add_column :users, :filename, :string
    add_column :users, :mime_type, :string
  end
end
