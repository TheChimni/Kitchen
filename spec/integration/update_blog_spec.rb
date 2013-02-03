require 'spec_helper'

describe 'Update an existing blog' do
  include ActionView::Helpers::DateHelper

  before do
    @post = BlogPost.create!(:title => "Test post", :content => "content for test post", :published_at => DateTime.now - 1)
  end

  context 'when not logged in' do
    it 'Edit blog post link is not present' do
      visit blog_post_path(@post)
      page.should_not have_link 'Edit'
    end

    it 'Navigating to the edit blog page redirects to the login page' do
      visit edit_blog_post_path(@post)
      current_path.should == new_user_session_path
    end
  end

  context 'when logged in' do
    include_context :authentication

    it 'Edit blog post link is present' do
      visit blog_post_path(@post)
      page.should have_link 'Edit'
    end

    it 'Navigating to the edit blog page opens the edit form' do
      visit edit_blog_post_path(@post)
      current_path.should == edit_blog_post_path(@post)
    end

    it 'we can change the content' do
      visit edit_blog_post_path(@post)
      fill_in 'Content', :with => 'New content'
      click_button 'Update'
      @post.reload
      @post.content.should == 'New content'
    end
  end
end
