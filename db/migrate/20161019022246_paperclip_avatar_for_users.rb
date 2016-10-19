class PaperclipAvatarForUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :avatar
    remove_column :users, :filename
    remove_column :users, :mime_type
    add_attachment :users, :avatar
  end
end
