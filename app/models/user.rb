class User < ApplicationRecord
  has_attached_file :avatar, :styles => { medium: "500x500", thumb: "150x150"}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  class << self
    def welcome_email(id)
      user = User.find(id)
      UserMailer.welcome(user).deliver
    end

    handle_asynchronously :welcome_email, run_at: Proc.new { 5.seconds.from_now }

  end
end
