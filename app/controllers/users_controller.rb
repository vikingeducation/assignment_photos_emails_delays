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

  def serve
    @user = User.find(params[:user_id])
    # # serving photo from local filesystem
    # send_file "#{@user.filename}", type: 'image/jpeg', disposition: 'inline'
    # # serving photo from controller
    # send_data(@user.data,  :type => @user.mime_type,
    #                        :filename => "#{@user.filename}.jpg",
    #                        :disposition => 'inline' )
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    # @user = User.new(user_params.except(:photo_data)) do |t|
        # # writing file to local filesystem
        # uploaded_io = user_params[:photo_data]
        # filename = uploaded_io.original_filename
        # filepath = Rails.root.join( 'public',
        #                             'uploads',
        #                             filename )
        # t.filename  = filepath
        # t.mime_type = uploaded_io.content_type
        # File.open(filepath, 'wb') do |file|
        #   file.write(uploaded_io.read)
        # end
      # # writing file to db column from controller
      # if user_params[:photo_data]
      #   t.data      = user_params[:photo_data].read
      #   t.filename  = user_params[:photo_data].original_filename
      #   t.mime_type = user_params[:photo_data].content_type
      # end
    # end

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
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :profile_picture)
    end
end
