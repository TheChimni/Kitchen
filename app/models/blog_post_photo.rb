class BlogPostPhoto < ActiveRecord::Base
  belongs_to :blog_post
  mount_uploader :image, PhotoUploader
end

