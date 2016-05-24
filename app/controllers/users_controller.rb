class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

=begin
  # This is to serve the file from our database
  def serve
    @photo = User.find(params[:user_id])
    send_file(@photo.data,  :type => @photo.mime_type,
                            :filename => "#{@photo.filename}.jpg",
                            :disposition => "inline")
  end
=end
  def serve
    @photo = User.find(params[:user_id])
    send_file(@photo.profile_photo_location)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    upload
    @user = User.new(user_params)
    @user.profile_photo_location = local_file_path(params[:user][:photo_data])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def local_file_path(file_data)
      Rails.root.join( 'public',
                       'uploads',
                       file_data.original_filename )
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # grab the uploaded binary blob and read it into a newly created file on our filesystem
    # NOTE that this should only be used carefully since our filesystem may not be available across different server instances!
    def upload
      uploaded_io = params[:user][:photo_data]
      filepath = local_file_path(uploaded_io)

      # Note that this will create a new file "filename" but it can NOT create a new folder, so you must already have a folder of that name "public/uploads" available.
      # The wb indicated that the file is opened for writing in binary mode.
      File.open(filepath, "wb") do |file|
        # Note that we're using the 'read' method
        file.write(uploaded_io.read)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :photo_data)
    end
end
