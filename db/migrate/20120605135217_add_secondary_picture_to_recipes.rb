class AddSecondaryPictureToRecipes < ActiveRecord::Migration
  def self.up
    change_table :recipes do |t|
      t.has_attached_file :secondary_picture
    end
  end

  def self.down
    drop_attached_file :recipes, :secondary_picture
  end
end
