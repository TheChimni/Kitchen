class BlogPostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    # using kaminari for paging
    page = params[:page] || 1
    @posts = BlogPost.page(page.to_i).per(5)
    return render :partial => 'blog_list' if request.xhr?
  end

  def show
  end

end

