class User < ApplicationRecord
  mount_uploader :profile_photo, ProfilePhotoUploader
end
