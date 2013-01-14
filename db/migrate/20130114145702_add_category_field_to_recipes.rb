class AddCategoryFieldToRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :category, :string, :null => false, :default => 'vegetarian'
  end
  def self.down
    remove_column :recipes, :category
  end
end
