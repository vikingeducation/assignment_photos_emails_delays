class AddPhotoColumnsToUserModel < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :photo_data, :binary, limit: 1.megabyte
    add_column :users, :photo_filename, :string
    add_column :users, :photo_mimetype, :string
  end
end
