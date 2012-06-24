require 'twitter'
require_relative '../../app/services/tweet_cache'

describe TweetCache do
  context 'when there is nothing in the Tweet database or the cache' do
    before do
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

    # it 'should save the tweet in the database' do
    #   Tweet.count.should == 1
    # end

   end

end