class Addcoltouser < ActiveRecord::Migration
  def change
    add_column :users, :filename, :string
    add_column :users, :mime_type, :string
  end
end
