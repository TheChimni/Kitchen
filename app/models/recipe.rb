class Recipe < ActiveRecord::Base
  validates_presence_of :title, :synopsis, :ingredient_list, :preparation_method, :category
  validates_length_of :synopsis, :maximum => 120
  has_and_belongs_to_many :ingredients
  has_many :recipe_photos

  validates :category, :inclusion => { :in => %w(vegan vegetarian non_vegetarian),
    :message => "%{value} is not a valid category" }

  before_save :save_ingredients

  def parse_ingredients
    regex = /\*([a-zA-Z\s]+)\*/
    ingredient_list.scan(regex).flatten
  end

  def primary_photo
    recipe_photos.first
  end

  def secondary_photo
    recipe_photos[1]
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
