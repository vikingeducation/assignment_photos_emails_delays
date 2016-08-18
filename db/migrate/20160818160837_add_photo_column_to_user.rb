class AddPhotoColumnToUser < ActiveRecord::Migration
  def change
  	add_column :users, :photo_data, :binary
  end
end
