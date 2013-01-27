require 'spec_helper'

describe 'Create a new blog' do

  context 'when not logged in' do
    it 'New blog post link is not present' do
      visit blog_posts_path
      page.should_not have_link 'New blog post'
    end

    it 'Navigating to the new blog page redirects to the login page' do
      visit new_blog_post_path
      current_path.should == new_user_session_path
    end
  end

  context 'when logged in' do
    include_context :authentication

    it 'New blog post link is present' do
      visit blog_posts_path
      page.should have_link 'New blog post'
    end

    it 'the New blog post link should open a new blog post form' do
      visit blog_posts_path
      click_link 'New blog post'
      current_path.should == new_blog_post_path
    end

    context 'new blog post form' do
      it 'creates a new post' do
        visit new_blog_post_path
        fill_in :blog_post_title, :with => 'test post'
        fill_in 'Content', :with => 'test content'
        click_button 'Save'
        current_path.should == blog_posts_path
        BlogPost.count.should == 1
        BlogPost.first.title.should == 'test post'
      end

      describe 'using markdown to format content' do
        it 'can create paragraphs' do
          visit new_blog_post_path
          fill_in :blog_post_title, :with => 'test post'
          fill_in 'Content', :with => 'paragraph 1\nparagraph 2'
          click_button 'Save'
          current_path.should == blog_posts_path
        end

        it 'can create bold text' do

        end
      end

      it 'lets me defer the published date'

      it 'lets me add images'

    end
  end

end

