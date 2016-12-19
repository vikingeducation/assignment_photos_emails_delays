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
    @user = User.new(user_params.except)
    # save_photo(params[:user][:photo])
    respond_to do |format|
      if @user.save
        User.delay.send_welcome_email(@user.id)
        # User.send_welcome_email(@user.id)

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

  def serve
    @user = User.find(params[:user_id])
    p "Hit serve method"
    send_data(@user.photo_data, type: @user.photo_mimetype, filename: "#{@user.photo_filename}", disposition: "inline")
  end

  def save_photo(uploaded_io)
    # uploaded_io = params[:person][:photo]
    filename = uploaded_io.original_filename
    filepath = Rails.root.join( 'public',
                                'uploaded_files',
                                filename )
    File.open(filepath, 'wb') do |file|
      file.write(uploaded_io.read)
    end
    @user.photo_file_path = filepath
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :photo)
    end
end
