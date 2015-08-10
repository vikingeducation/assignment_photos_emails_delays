class PhotosController < ApplicationController

  def new
    user = User.find(params[:user_id])
    @photo = user.profile_photo
  end

  def create
    # @photo =

  end

  private
end
