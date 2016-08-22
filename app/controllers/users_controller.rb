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
    #without paperclip
    # upload
    # @user = User.new(user_params.except(:profile_photo)) do |t|
    #   if user_params[:profile_photo]
    #     t.data      = user_params[:profile_photo].read
    #     t.filename  = user_params[:profile_photo].original_filename
    #     t.mime_type = user_params[:profile_photo].content_type
    #   end
    # end

    respond_to do |format|
      if @user.save
        User.welcome_email(@user.id)
        format.html { redirect_to @user, notice: 'User was successfully created with Photo.' }
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
    @photo = User.find(params[:user_id])
    # send_data(@photo.data,  :type => @photo.mime_type,
    #                         :filename => "#{@photo.filename}.jpg",
    #                         :disposition => "inline")
    filepath = Rails.root.join( 'public',
                                  'uploads',
                                  @photo.filename )
    send_file(filepath, type: @photo.mime_type)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :avatar)
    end

    def upload
      uploaded_io = params[:user][:profile_photo]
      filename = uploaded_io.original_filename
      filepath = Rails.root.join( 'public',
                                  'uploads',
                                  filename )
      File.open(filepath, 'wb') do |file|
        file.write(uploaded_io.read)
      end
    end

end
