class PhotosController < ApplicationController
  def new
  end

  def create
    # fail
    uploaded_io = params[:data]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)

    end

    user = User.find_by_id(params[:user_id])
    user.profile_photo_path = Rails.root.join('public', 'uploads', uploaded_io.original_filename).to_s
    user.save!

    redirect_to root_path

  end
end
