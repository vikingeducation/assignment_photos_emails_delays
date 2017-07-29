class PhotosController < ApplicationController



  def serve
    @user_photo = User.find(params[:id]).profile_photo
    send_data(@user_photo.data,   :type => @user_photo.mime_type,
                                  :filename => "#{@user_photo.filename}.jpg",
                                  :disposition => "inline")
  end

  # def new
  #   @photo = Photo.new
  #   @user = User.find(params[:user_id])
  # end
  #
  # def create
  #   @photo = Photo.new(photo_params)
  # end
  #
  # private
  # def photo_params
  #   require(:photo).permit(:photo_data)
  # end


end
