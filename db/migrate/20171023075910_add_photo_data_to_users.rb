class AddPhotoDataToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :photo_data, :binary, limit: 10.megabyte
    add_column :users, :photo_filename, :string
    add_column :users, :photo_mime_type, :string
  end
end
