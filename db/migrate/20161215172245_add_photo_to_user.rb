class AddPhotoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profile_photo_data, :binary, limit: 3.megabyte
    add_column :users, :profile_photo_name, :string
    add_column :users, :profile_photo_mime_type, :string
  end
end
