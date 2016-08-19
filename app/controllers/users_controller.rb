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
    send_data(@user.data,  :type => @user.mime_type,
                            :filename => "#{@user.filename}.png",
                            :disposition => "inline")
  end


  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params.except(:profile_photo))


## saving into database
# could be done in user model with a virtual attribute
    # if user_params[:profile_photo]
    #   @user.data = user_params[:profile_photo].read
    #   @user.filename = user_params[:profile_photo].original_filename
    #   @user.mime_type = user_params[:profile_photo].content_type
    # end


## saving local
    # uploaded_io = user_params[:profile_photo]
    # filename = uploaded_io.original_filename
    # filepath = Rails.root.join( 'public',
    #   'uploads',
    #   filename )
    #
    # File.open(filepath, 'wb') do |file|
    #   file.write(uploaded_io.read)
    # end


    respond_to do |format|
      if @user.save
        @user.delay.send_welcome_email

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
      params.require(:user).permit(:username, :email, :avatar)
    end
end
