class TweetCache
  def self.last_tweet
    tweet = Twitter.user_timeline('bbcfood').first(1).collect { |tweet| tweet.text }
    # Tweet.create! :text => tweet
    tweet
  end
end