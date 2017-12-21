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
    # @photo = Photo.new(photo_params)
    @user = User.new(user_params)

    respond_to do |format|

       # check if a photo was included when creating a new User
       photo_upload = params[:photo_data]

      if @user.save
        format.html { redirect_to @user, notice: 'User and photo was successfully created.' }
        # redirect_to(@photo, :notice => 'Photo was successfully created.')
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        # render :action => "new"
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

    if @user.filename
      filename = Rails.root.join('public', 'uploads', @user.filename)
      File.delete(filename) if File.exist?(filename)
    end
      
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Grab the photo blob from the database and pass
  # it to `send_data` along with some useful options
  # This replaces the normal `render` process
  def serve
    @photo = User.find(params[:user_id])
    send_data(@photo.data,  :type => @photo.mime_type, 
                            :filename => "#{@photo.filename}.jpg",
                            :disposition => "inline")


    # send_file("./public/uploads/#{@user.filename}",
    #             type: @user.mime_type,
    #             disposition: 'inline' )
  end

  # Using local filesystem
  # grab the uploaded binary blob and read it
  #   into a newly created file on our filesystem
  # NOTE that this should only be used carefully 
  #   since our filesystem may not be available
  #   across different server instances!
  def upload
    uploaded_io = params[:user][:photo_data]
    filename = uploaded_io.original_filename

    filepath = Rails.root.join( 'public', 
                                'uploads', 
                                filename )

    # Note that this will create a new file "filename" but it
    #   can NOT create a new folder, so you must already
    #   have a folder of that name "public/uploads" available.

    File.open(filepath, 'wb') do |file|
      # Note that we're using the `read` method
      file.write(uploaded_io.read)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :photo_data)
    end
end
