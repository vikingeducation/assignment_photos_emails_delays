class User < ActiveRecord::Base
  before_destroy :remove_photo

  def profile_photo_url
    "/uploads/#{self.profile_photo_filename}"
  end

  def profile_photo=(value)
    mkdir_uploads
    p ['Upload: ', value]
    self.profile_photo_data = value.read
    self.profile_photo_filename = value.original_filename
    self.profile_photo_mime_type = value.content_type
    value.rewind
    write_upload(value)
  end


  private
  def mkdir_uploads
    FileUtils.mkdir_p "#{Rails.public_path}/uploads"
  end

  def write_upload(file)
    File.open(profile_photo_path, 'wb') do |f|
      f.write(file.read)
    end
  end

  def remove_photo
    FileUtils.rm(profile_photo_path) if File.exists?(profile_photo_path)
  end

  def profile_photo_path
    Rails.root.join('public', 'uploads', self.profile_photo_filename)
  end
end
