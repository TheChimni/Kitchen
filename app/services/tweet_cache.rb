class TweetCache
  def self.last_tweet
    Rails.cache.fetch('latest_tweet', :expires_in => 5.minutes) do
      begin
        tweet = Twitter.user_timeline('zanzaneet').first(1).collect { |tweet| tweet.text }
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
end
