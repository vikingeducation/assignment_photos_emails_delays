class AddPhotoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_photo, :binary, :limit => 10.megabyte
  end
end
