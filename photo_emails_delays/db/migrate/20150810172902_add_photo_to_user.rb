class AddPhotoToUser < ActiveRecord::Migration
  def up
    add_column :users, :profile_photo, :binary, :limit => 10.megabytes
  end

  def down
    remove_column :users, :profile_photo
  end
end
