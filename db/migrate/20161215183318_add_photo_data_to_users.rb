class AddPhotoDataToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profile_photo, :binary
  end
end
