class Workout < ActiveRecord::Base
  validates :name, :video, presence: true
  mount_uploader :video, VideoUploader
end
