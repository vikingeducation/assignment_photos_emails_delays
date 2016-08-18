class AddPhotoToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_photo, :binary, :limit => 10.megabyte
    add_column :users, :filename, :string
    add_column :users, :mimetype, :string
  end
end
