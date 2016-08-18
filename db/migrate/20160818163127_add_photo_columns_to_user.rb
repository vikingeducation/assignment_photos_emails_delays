class AddPhotoColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :profile_photo
    add_column :users, :data, :binary
    add_column :users, :filename, :string
    add_column :users, :mime_type, :string
  end
end
