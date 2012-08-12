class AddSynopsisToRecipes < ActiveRecord::Migration
  def change
    #change_table :recipes do |t|
      #t.string :synopsis
    #end

    #Recipe.all.each { |recipe| recipe.update_attributes!(:synopsis => recipe.description) }

    change_table :recipes do |t|
      t.string :synopsis, :null => false
    end
  end
end
