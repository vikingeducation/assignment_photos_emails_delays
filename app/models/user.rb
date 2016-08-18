class User < ActiveRecord::Base
	attr_accessor :data, :filename, :mime_type
	
	# def user_data=(user_data)
	#     self.data      = user_data.read
	#     self.filename  = user_data.original_filename
	#     self.mime_type = user_data.content_type
	# end
end
