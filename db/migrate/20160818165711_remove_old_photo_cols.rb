class RemoveOldPhotoCols < ActiveRecord::Migration
  def change
    remove_column :users, :profile_photo
    remove_column :users, :mime_type
    remove_column :users, :file_name
  end
end
