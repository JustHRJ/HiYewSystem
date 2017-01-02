class Image < ActiveRecord::Base
  belongs_to :project
  mount_uploader :picture, PictureUploader
  
  validates :picture, presence: true
  validates :name, presence: true
end
