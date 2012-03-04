class Recipe < ActiveRecord::Base
  validates_presence_of :title, :description, :ingredients, :preparation_method
  has_attached_file :picture, :styles => { :wide => "960x600#", :large => "800x600>", :medium => "400x300>", :thumb => "120x90>" }
end
