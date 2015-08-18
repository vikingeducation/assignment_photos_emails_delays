class AddPhotoToUser < ActiveRecord::Migration

  def up
    add_column :users, :user_photo, :binary, :limit => 10.megabytes
  end

  def down
    remove_column :users, :user_photo
  end

end
