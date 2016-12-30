class Image < ActiveRecord::Base
  belongs_to :project
  mount_uploader :picture, PictureUploader
end
