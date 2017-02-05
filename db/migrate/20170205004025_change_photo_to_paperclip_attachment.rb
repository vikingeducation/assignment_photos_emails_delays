class ChangePhotoToPaperclipAttachment < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :data
    remove_column :users, :filename
    remove_column :users, :mime_type
    add_attachment :users, :profile_picture
  end
end
