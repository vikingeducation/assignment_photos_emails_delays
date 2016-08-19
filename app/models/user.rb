class User < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300", :thumb => "100x100" }, :storage => :s3

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def self.send_welcome_email(user_id)
    @user = User.find(user_id)
    UserMailer.welcome(@user).deliver!
  end

  # def s3_credentials
  #   {:bucket => "#{Rails.application.secrets.BUCKET}", :access_key_id => "#{Rails.application.secrets.ACCESS_KEY_ID}", :secret_access_key => "#{Rails.application.secrets.SECRET_ACCESS_KEY}"}
  # end
end
