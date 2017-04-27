class SwitchToPaperclip < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :photo_path, :string
    add_attachment :users, :profile_photo
  end
end
