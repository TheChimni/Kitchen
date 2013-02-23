require 'spec_helper'

describe BlogPost do
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }

  it { should have_many :blog_post_photos }

  describe '#published_at' do
    let(:now) { DateTime.new(2013, 2, 24, 12, 0, 0) }
    before { DateTime.stub(:now).and_return(now) }

    it 'populates the published_at date with the created_at date if not specified' do
      post = BlogPost.create! :title => 'test', :content => 'test'
      post.published_at.should == now
    end

    it 'allows published_at dates in the future' do
      publication_date = 2.days.from_now
      post = BlogPost.create! :title => 'test', :content => 'test', :published_at => publication_date
      post.published_at.should == publication_date
    end
  end
end

