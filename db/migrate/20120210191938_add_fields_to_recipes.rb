class AddFieldsToRecipes < ActiveRecord::Migration
  def change
    change_table :recipes do |t|
      t.text :ingredients
      t.text :preparation_method
      t.integer :preparation_time, :default => 30
      t.integer :cooking_time, :default => 30
      t.integer :rating, :default => 1
      t.integer :difficulty_level, :default => 1
      t.string :country 
      t.string :region 
      t.string :serves, :default => '1-2'
    end
  end
end
