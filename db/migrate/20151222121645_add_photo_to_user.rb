class AddPhotoToUser < ActiveRecord::Migration
  def change
    add_column :users, :photo_content, :binary, limit: 5.megabytes
    add_column :users, :photo_filename, :string
    add_column :users, :photo_mime_type, :string
  end
end
