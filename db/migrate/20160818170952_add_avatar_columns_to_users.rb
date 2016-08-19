class AddAvatarColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_attachment :users, :avatar
    remove_column :users, :data
    remove_column :users, :filename
    remove_column :users, :mime_type
  end
end
