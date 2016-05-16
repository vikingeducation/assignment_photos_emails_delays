class AddAttachmentPaperclipPhotoToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :paperclip_photo
    end
  end

  def self.down
    remove_attachment :users, :paperclip_photo
  end
end
