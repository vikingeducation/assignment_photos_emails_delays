class AddNewColumnToUsersToProfilePhotoLocalFileAddress < ActiveRecord::Migration
  def change
    add_column :users, :profile_photo_location, :string
  end
end
