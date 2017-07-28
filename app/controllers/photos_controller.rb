class PhotosController < ApplicationController

  def new
    @photo = Photo.new
    @user = User.find(params[:user_id])
  end

  def create
    @photo = Photo.new(photo_params)
    #
    # respond_to do |format|
    #   if @user.save
    #     format.html { redirect_to @user, notice: 'User was successfully created.' }
    #     format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  private
  def photo_params
    require(:photo).permit(:photo_data)
  end


end
