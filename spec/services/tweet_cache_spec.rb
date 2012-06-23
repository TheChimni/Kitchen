require 'twitter'
require_relative '../../app/services/tweet_cache'

describe TweetCache do
  it 'when there is nothing in the databse or the cache, it should fetch the tweet from twitter service' do
    # We need to mock Twitter because we want to assert that the Twitter API is called in this scenario (empty cache)
    Twitter.should_receive(:user_timeline).and_return(stub('User Timeline Stub').stub(:first => [stub('Stubbed Tweet').stub(:text => 'nutcase')]))
    TweetCache.last_tweet.should eql('bonkers')
  end
  
end