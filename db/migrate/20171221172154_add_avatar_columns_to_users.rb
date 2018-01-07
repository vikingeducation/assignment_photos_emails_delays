class AddAvatarColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    # paperclip convenience method which adds their 
    # four columns
    add_attachment :users, :avatar
  end
end
