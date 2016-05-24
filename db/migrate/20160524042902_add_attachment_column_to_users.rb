class AddAttachmentColumnToUsers < ActiveRecord::Migration
  def change
    # paperclip convenience method which adds their
    # four coulumns
    add_attachment :users, :avatar
  end
end
