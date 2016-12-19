class User < ApplicationRecord

  # virtual attribute on User for saving files to DB
  def photo_data=(photo_data)
    self.data = photo_data.read
    self.filename = photo_data.original_filename
    self.mime_type = photo_data.content_type
  end

  has_attached_file :avatar, styles: {
    thumb: "100x100", small: "200x200" }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # callback to send email after user created
  # after_create :send_welcome

  # callback to QUEUE send email after user created
  after_create :queue_welcome_email

  private
    # method to send welcome email (immediately)
    # def send_welcome
    #   UserMailer.welcome(self).deliver
    # end

    # method to queue a welcome email (delayed)
    # pass in an id in case the state of the user changes
    # delay automatically delivers?
    def queue_welcome_email
      UserMailer.delay(run_at: 5.seconds.from_now).welcome(self.id)
    end

end
