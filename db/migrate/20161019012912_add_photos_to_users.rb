class AddPhotosToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :avatar,    :binary, :limit => 10.megabytes
    add_column :users, :filename,  :string
    add_column :users, :mime_type, :string
  end
end
