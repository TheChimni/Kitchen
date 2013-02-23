class BlogPostPhotosController < ApplicationController
  before_filter :authenticate_user!

  def new
    @blog_post = BlogPost.find(params[:blog_post_id])
    @blog_post_photo = BlogPostPhoto.new
  end

  def create
    @blog_post = BlogPost.find(params[:blog_post_id])
    if @blog_post.blog_post_photos.create(params[:blog_post_photo])
      redirect_to edit_blog_post_path(@blog_post)
    else
      render :new
    end
  end

  def edit
    @blog_post = BlogPost.find(params[:blog_post_id])
    @blog_post_photo = BlogPostPhoto.find(params[:id])
  end

  def update
    @blog_post = BlogPost.find(params[:blog_post_id])
    @blog_post_photo = BlogPostPhoto.find(params[:id])
    if @blog_post_photo.update_attributes(params[:blog_post_photo])
      redirect_to edit_blog_post_path(@blog_post)
    else
      render :edit
    end
  end

  def destroy
    @blog_post = BlogPost.find(params[:blog_post_id])
    @blog_post_photo = BlogPostPhoto.find(params[:id])
    @blog_post_photo.destroy
    redirect_to edit_blog_post_path(@blog_post)
  end

end

