class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
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
    @user = User.new(user_params)

    respond_to do |format|
      # check if a photo was included when creating a new User
      photo_upload = params[:user_photo]
      filename = Rails.root.join('public', 'uploads', photo_upload.original_filename)

      if photo_upload
        @user.photo_filename = photo_upload.original_filename
        @user.photo_mime_type = photo_upload.content_type

        File.open(filename, 'wb') do |f|
          f.write(photo_upload.read)
        end
      end

      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        # delete photo here too if it was uploaded and User was not saved
        File.delete(filename) if File.exist?(filename)

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
    # delete User photo here too if one exists
    if @user.photo_filename
      filename = Rails.root.join('public', 'uploads', @user.photo_filename)
      File.delete(filename) if File.exist?(filename)
    end

    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def serve_photo
    @user = User.find(params[:user_id])

    # send_data(@user.photo_data, type: @user.photo_mime_type, filename: @user.photo_filename, disposition: 'inline')

    # Use send_file if serving photo from filesystem
    path = Rails.root.join('public', 'uploads', @user.photo_filename)
    mime_type = @user.photo_mime_type

    send_file(path, type: mime_type, disposition: 'inline')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email)
    end
end
