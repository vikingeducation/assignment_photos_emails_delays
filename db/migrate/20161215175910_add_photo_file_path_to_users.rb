class AddPhotoFilePathToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :photo_file_path, :string
  end
end
