class AddPhotoBlobToUsers < ActiveRecord::Migration
  def change
    add_column :users, :blob_data, :binary, limit: 3.megabyte
    add_column :users, :blob_content_type, :string
  end
end
