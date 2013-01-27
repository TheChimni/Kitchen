require 'spec_helper'

describe 'Blog page' do

  let(:published_at) { DateTime.new(2012, 2, 24, 12, 0, 0) }

  context "with blog entry containing 3 paragraphs" do
    include ActionView::Helpers::DateHelper

    before do
      @post = BlogPost.create! :title => "Test post title", :content => "Paragraph 1 text\n\nParagraph 2 text\n\nSome *italic text*", :published_at => published_at
      visit blog_post_path(@post)
    end

    it "displays title" do
      page.should have_content "Test post title"
    end

    it "displays 3 paragraphs" do
      page.should have_css("article p", :count => 3)
    end

    it "displays italic text" do
      page.find("em", :text => 'italic text')
    end
  end

end

