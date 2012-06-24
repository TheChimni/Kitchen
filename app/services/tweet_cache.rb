class TweetCache
  def self.last_tweet
    tweet = Twitter.user_timeline('bbcfood').first(1).collect { |tweet| tweet.text }
    tweet_model = Tweet.first || Tweet.new
    tweet_model.text = tweet.first
    tweet_model.save!
    tweet
  end
end