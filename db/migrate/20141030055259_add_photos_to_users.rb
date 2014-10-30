class AddPhotosToUsers < ActiveRecord::Migration
  def change
    add_column :users, :photo, :binary, limit: 10.megabytes
    add_column :users, :mime_type, :string
    add_column :users, :photoname, :string
  end
end
