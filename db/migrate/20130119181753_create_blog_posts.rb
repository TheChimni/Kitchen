class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.datetime :published_at

      t.timestamps
    end
  end
end
