class PhotosController < ApplicationController

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to(@photo, notice: 'Photo was successfully created.')
    else
      render action: 'new'
    end
  end

  def serve
    @photo = Photo.find(params[:photo_id])
    send_data(@photo.data, type: @photo.mime_type,
                       filename: "#{@photo.filename}.jpg",
                    disposition: "inline")
  end                    

  private

    def photo_params
      params.require(:photo).permit(:photo_data)
    end
end
