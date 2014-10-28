class AddPhototoUsers < ActiveRecord::Migration
  def up
    add_column :users, :photo, :binary, limit: 5.megabytes
  end

  def down
    remove_column :users, :photo
  end
end
