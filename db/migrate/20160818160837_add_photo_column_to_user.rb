class AddPhotoColumnToUser < ActiveRecord::Migration
  def change
  	add_column :users, :profile_photo_data, :binary
    add_column :users, :profile_photo_filename, :string
    add_column :users, :profile_photo_mime_type, :string
  end
end
