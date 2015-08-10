class PhotosController < ApplicationController
  def new
  end

  def create
    # fail
    uploaded_io = params[:data]
    File.open(Rails.root.join('app', 'assets', 'images', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)

    end

    user = User.find_by_id(params[:user_id])
    # path = Rails.root.join('public', 'uploads', uploaded_io.original_filename).to_s
    # user.profile_photo_path = path.split("/")[-1]
    user.profile_photo_path = uploaded_io.original_filename
    user.save!

    redirect_to root_path

  end
end
