class Recipe < ActiveRecord::Base
  validates_presence_of :title, :description, :ingredients, :preparation_method
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
