class BlogPostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    # using kaminari for paging
    page = params[:page] || 1
    @posts = BlogPost.order('published_at DESC').page(page.to_i).per(5)
    return render :partial => 'blog_list' if request.xhr?
  end

  def show
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

end

