class AddAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :data, :binary, :limit => 10.megabyte
    add_column :users, :filename, :binary, :limit => 10.megabyte
    add_column :users, :mime_type, :binary, :limit => 10.megabyte
  end
end
