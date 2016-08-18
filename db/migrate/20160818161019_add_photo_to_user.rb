class AddPhotoToUser < ActiveRecord::Migration[5.0]
  def change

    add_column :users, :profile_photo, :binary, :limit => 10.megabytes
    
  end
end
