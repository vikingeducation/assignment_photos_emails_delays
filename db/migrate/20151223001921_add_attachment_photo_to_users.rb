class AddAttachmentPhotoToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :photo
    end

    remove_column :users, :photo_content, :binary
    remove_column :users, :photo_filename, :string
    remove_column :users, :photo_mime_type, :string
  end

  def self.down
    remove_attachment :users, :photo
  end
end
