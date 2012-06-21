class Recipe < ActiveRecord::Base
  validates_presence_of :title, :description, :ingredient_list, :preparation_method
  has_and_belongs_to_many :ingredients
  has_attached_file :picture, :styles => { :wide => "960x600#", :large => "800x600>", :medium =>"500x375>", :small => "400x300>", :thumb => "180x180>" }
  has_attached_file :secondary_picture, :styles => { :wide => "960x600#", :large => "800x600>", :medium =>"500x375>", :small => "400x300>", :thumb => "180x180>" }


  before_save :save_ingredients

  def parse_ingredients
    regex = /\*([a-zA-Z\s]+)\*/
    ingredient_list.scan(regex).flatten
  end

  private
  def save_ingredients
    ingredients.clear
    parse_ingredients.each do |title|
      existing_ingredient = Ingredient.where(:title => title).first
      if existing_ingredient.nil?
        ingredients << Ingredient.create(:title => title)
      else
        ingredients << existing_ingredient unless ingredients.include?(existing_ingredient)
      end
    end
  end
end
