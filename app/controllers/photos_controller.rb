class PhotosController < ApplicationController
  def serve
    @user = User.find(params[:user_id])
    send_data(@user.profile_photo_data, 
              type: @user.profile_photo_mime_type,
              filename: @user.profile_photo_name,
              disposition: 'inline')
  end
end
