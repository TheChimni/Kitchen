class BlogPostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    # using kaminari for paging
    page = params[:page] || 1
    @posts = BlogPost.where("published_at < ?", DateTime.now).order('published_at DESC').page(page.to_i).per(5)
    return render :partial => 'blog_list' if request.xhr?
  end

  def show
    @post = BlogPost.published.find params[:id]
  end

  def new
    @post = BlogPost.new
  end

  def create
    @post = BlogPost.create params[:blog_post]
    if @post.save
      redirect_to blog_posts_path
    else
      render :new
    end
  end

  def edit
    @post = BlogPost.find params[:id]
  end

  def update
    @post = BlogPost.find(params[:id])
    if @post.update_attributes(params[:blog_post])
      redirect_to blog_post_path(@post)
    else
      render :edit
    end
  end

end

