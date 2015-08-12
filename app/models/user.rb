class User < ActiveRecord::Base
  has_attached_file :avatar,
                    :styles => { :medium => "300x300", :thumb => "100x100" }

  validates_attachment_content_type :avatar,
                                    :content_type => /\Aimage\/.*\Z/

  after_create :send_welcome_email

  private

  def send_welcome_email
    User.send_welcome_email(self.id)
  end
  # handle_asynchronously :send_welcome_email,
                        # :run_at => Proc.new {15.seconds.from_now},
                        # :priority => 1

  def self.send_welcome_email(id)
    user= User.find(id)
    UserMailer.welcome(user).deliver!
  end

end
