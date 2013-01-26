require 'spec_helper'

describe 'Blog page' do

  let(:published_at) { DateTime.new(2013, 2, 24, 12, 0, 0) }

  before do
    # Stubbing the external twitter API
    @tweets = ['I fancy chocolate pudding today.', 'I fancy indian veg roll today.']
    Twitter.stub(:user_timeline => @tweets.collect { |tweet| stub(:text => tweet) })
  end

  context "with 3 blog entries" do
    include ActionView::Helpers::DateHelper

    before do
      (1..3).each do |n|
        BlogPost.create! :title => "Post no. #{n}", :content => "content for post number #{n}", :published_at => (published_at - n)
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
end
