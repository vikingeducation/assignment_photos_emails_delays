class User < ActiveRecord::Base

  attr_accessor :profile_photo

  # Save to Database

  # def profile_photo=(profile_photo)
  #   self.data = profile_photo.read
  #   self.filename = profile_photo.original_filename
  #   self.mime_type = profile_photo.content_type
  # end


  def profile_photo=(profile_photo)
    uploaded_io = profile_photo
    filename = uploaded_io.original_filename
    filepath = Rails.root.join( "public",
                                "upload",
                                filename )
    File.open(filepath, 'wb') do |file|
      file.write( uploaded_io.read )
    end
    self.filename = filepath
  end
end
