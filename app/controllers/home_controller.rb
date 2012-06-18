class HomeController < ApplicationController
  def index
    @recipes = Recipe.all
    @tweets = Twitter.user_timeline('bbcfood').first(3).collect { |tweet| tweet.text }
  end
end