require 'spec_helper'


describe 'Blog page' do
  before do
    # Stubbing the external twitter API
    @tweets = ['I fancy chocolate pudding today.', 'I fancy indian veg roll today.']
    Twitter.stub(:user_timeline => @tweets.collect { |tweet| stub(:text => tweet) })
  end

  context "with 3 blog entries" do
    include ActionView::Helpers::DateHelper

    let(:published_at) { DateTime.new(2013, 2, 24, 12, 0, 0) }

    before do
      (1..3).each do |n|
        BlogPost.create! :title => "Post no. #{n}", :content => "content for post number #{n}", :published_at => published_at
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
      page.should have_content "#{time_ago_in_words(published_at)} ago"
    end

  end
end
