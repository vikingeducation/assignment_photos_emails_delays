class AddProfilePhotoColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_attachment :users, :profile_photo
  end
end
