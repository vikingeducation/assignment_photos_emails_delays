class AddPictureColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :picture, :binary
  end
end
