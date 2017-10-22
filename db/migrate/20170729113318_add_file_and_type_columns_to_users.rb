class AddFileAndTypeColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :filename, :string
    add_column :users, :mime_type, :string
  end
end
