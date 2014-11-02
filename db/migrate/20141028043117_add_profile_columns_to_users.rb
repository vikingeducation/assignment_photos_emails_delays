class AddProfileColumnsToUsers < ActiveRecord::Migration
  def change
    add_attachment :users, :profile
  end
end
