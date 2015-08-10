class AddProfileImagestoUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_photo_path, :string
  end
end
