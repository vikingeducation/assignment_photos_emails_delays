class AddPhotoColumnsToUser < ActiveRecord::Migration
  def up
    add_column :users, :filename, :string
    add_column :users, :mime_type, :string
  end

  def down
    remove_column :users, :filename
    remove_column :users, :mime_type
  end
end
