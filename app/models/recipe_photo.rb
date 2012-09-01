class RecipePhoto < ActiveRecord::Base
  belongs_to :recipe
  mount_uploader :image, PhotoUploader
end

