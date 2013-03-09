class CreateBlogPostPhotos < ActiveRecord::Migration
  def change
    create_table :blog_post_photos do |t|
      t.integer :blog_post_id
      t.string :title
      t.string :image
      t.timestamps
    end
  end
end
