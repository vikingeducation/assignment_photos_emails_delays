class AddPaperclipToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :photo
    remove_column :users, :mime_type
    remove_column :users, :photoname
    add_attachment :users, :photo
  end
end
