class RecipePhoto < ActiveRecord::Base
  belongs_to :recipe
  mount_uploader :image, PhotoUploader
  # attr_accessible :recipe, :title, :image
end

