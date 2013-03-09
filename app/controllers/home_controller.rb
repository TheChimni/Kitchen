class HomeController < ApplicationController
  def index
    @show_header = true
    @recipes = Recipe.all
    @subscription = Subscription.new
    begin
      @tweets = Twitter.user_timeline('zanzaneet').first(1).collect { |tweet| tweet.text }
    rescue
      @tweets = ['Twitter not available']
    end
  end
end
