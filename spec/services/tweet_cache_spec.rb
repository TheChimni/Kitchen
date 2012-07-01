require 'spec_helper'

describe TweetCache do
  context 'when there is nothing in the Tweet database or the cache' do
    before do
      Rails.cache.clear
      timeline_stub = stub('User Timeline Stub')
      tweet_stub = stub('Stubbed Tweet')
      tweet_stub.stub(:text => 'nutcase')
      timeline_stub.stub(:first).and_return([tweet_stub])
      Twitter.should_receive(:user_timeline).and_return(timeline_stub)
    end

    it 'should fetch the tweet from twitter service' do
      # We need to mock Twitter because we want to assert that the Twitter API is called in this scenario (empty cache)
      TweetCache.last_tweet.should eql(['nutcase'])
    end

    it 'should save the tweet in the database' do
      TweetCache.last_tweet
      Tweet.count.should == 1
      Tweet.first.text.should == 'nutcase'
    end
  end

   
  context 'when there is nothing in the cache but a record exists in the Tweet database' do
    before do
      Rails.cache.clear
      timeline_stub = stub('User Timeline Stub')
      tweet_stub = stub('Stubbed Tweet')
      tweet_stub.stub(:text => 'nutcase')
      timeline_stub.stub(:first).and_return([tweet_stub])
      Twitter.should_receive(:user_timeline).and_return(timeline_stub)
      Tweet.create! :text => 'bonkers'
    end

    it 'should fetch the tweet from the twitter service' do
      # We need to mock Twitter because we want to assert that the Twitter API is called in this scenario (empty cache)
      TweetCache.last_tweet.should eql(['nutcase'])
    end

    it 'should overwrite the tweet in the database' do
      TweetCache.last_tweet
      Tweet.count.should == 1
      Tweet.first.text == 'nutcase'
    end
  end

  context 'when a record exist in the Tweet database and the Twitter API throws an exception' do
    before do
      Rails.cache.clear
      Twitter.should_receive(:user_timeline).and_raise
      Tweet.create! :text => 'bonkers'
    end

    it 'should return the last tweet from the the database' do
      TweetCache.last_tweet.should eql(['bonkers'])
    end

  end

  context 'when there is a tweet in the cache that is less than 5 minutes old' do

    it 'should return the last tweet from the the cache' do
      #Rails.cache.write('latest_tweet', ['dumbo'])
      Twitter.should_not_receive(:user_timeline)
      # TODO: Work out a better way to assert that the user_timeline does not get called
      # (as is the should_not_receive exception is being swallowed by the rescue claues in code under test)
      TweetCache.last_tweet.should eql(['dumbo'])
    end

  end

  context 'when there is a tweet in the cache that is more than 5 minutes old' do

    it 'should call the Twitter API'

  end
end