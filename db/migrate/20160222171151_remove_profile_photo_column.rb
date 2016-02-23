class RemoveProfilePhotoColumn < ActiveRecord::Migration
  def change
    remove_column :users, :profile_photo
  end
end
