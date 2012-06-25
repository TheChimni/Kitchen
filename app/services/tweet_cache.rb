class TweetCache
  def self.last_tweet
    begin
      tweet = Twitter.user_timeline('bbcfood').first(1).collect { |tweet| tweet.text }
      tweet_model = Tweet.first || Tweet.new
      tweet_model.text = tweet.first
      tweet_model.save!
      tweet
    rescue Exception
      tweet_model = Tweet.first
      tweet_model.nil? ? [] : [tweet_model.text]
    end
  end
end