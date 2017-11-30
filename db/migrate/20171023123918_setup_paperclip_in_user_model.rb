class SetupPaperclipInUserModel < ActiveRecord::Migration[5.1]
  def change
    remove_columns(:users, :photo_data, :photo_filename, :photo_mime_type)

    add_attachment :users, :profile_photo
  end
end
