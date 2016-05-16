class AddPhotoFileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :filename, :string
    add_column :users, :filepath, :string
    add_column :users, :file_content_type, :string
  end
end
