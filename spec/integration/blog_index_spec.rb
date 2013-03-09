require 'spec_helper'

describe 'Blog page' do

  let(:published_at) { DateTime.new(2012, 2, 24, 12, 0, 0) }

  before do
    # Stubbing the external twitter API
    @tweets = ['I fancy chocolate pudding today.', 'I fancy indian veg roll today.']
    Twitter.stub(:user_timeline => @tweets.collect { |tweet| stub(:text => tweet) })
  end

  context "with 3 blog entries" do
    include ActionView::Helpers::DateHelper

    before do
      @posts = []
      (1..3).each do |n|
        @posts << BlogPost.create!(:title => "Post no. #{n}", :content => "content for post number #{n}", :published_at => (published_at - n))
      end
    end

    it 'can use the main menu to open the blog from the home page' do
      visit root_path
      click_link 'Blog'
      current_path.should == blog_posts_path
    end

    it 'shows titles of all 3 entries' do
      visit blog_posts_path
      (1..3).each do |n|
        page.should have_content "Post no. #{n}"
      end
    end

    it 'shows content of all 3 entries' do
      visit blog_posts_path
      (1..3).each do |n|
        page.should have_content "content for post number #{n}"
      end
    end

    it 'shows publication date' do
      visit blog_posts_path
      (1..3).each do |n|
        page.should have_content "#{time_ago_in_words(published_at - n)} ago"
      end
    end

    it 'results should not be paged' do
      visit blog_posts_path
      page.should_not have_link 'More'
    end

    it 'shows most recent first' do
      visit blog_posts_path
      (1..3).each do |n|
        page.find("#blogListContainer article:nth-of-type(#{n})").text.should =~ /Post no. #{n}/
      end
    end

    it "each post has a 'Read more' link" do
      visit blog_posts_path
      @posts.each do |post|
        page.should have_link('Read more', :href => blog_post_path(post))
      end
    end

  end

  context "with 6 blog entries" do

    before do
      (1..6).each do |n|
        BlogPost.create! :title => "Post no. #{n}", :content => "content for post number #{n}", :published_at => (published_at + n)
      end
    end

    it 'results are paged' do
      visit blog_posts_path
      page.should_not have_content "Post no. 1"
      page.should have_link 'More'
    end

  end

  context "with unpublished posts" do

    let(:today) { Date.today }

    before do
      @unpublished_post = BlogPost.create! :title => "Published next week", :content => "test content", :published_at => (today + 7)
      @published_post = BlogPost.create! :title => "Published last week", :content => "test content", :published_at => (today - 7)
      visit blog_posts_path
    end

    it 'does not show the unpublished post' do
      page.should_not have_content "Published next week"
    end

    it 'shows the published post' do
      page.should have_content "Published last week"
    end

    it "'Read more' link navigates to the show page for the publised post" do
      page.click_link 'Read more'
      current_path.should == blog_post_path(@published_post)
    end

    it "Attempting to open the show page for the unpublised post raises error" do
      -> { visit blog_post_path(@unpublished_post) }.should raise_error
    end

  end

end
