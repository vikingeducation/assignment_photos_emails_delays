class AddPhotoTypetoUsers < ActiveRecord::Migration
  def change
    add_column :users, :photo_type, :string
    add_column :users, :filename, :string
  end
end
