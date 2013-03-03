class NewsletterManager

  def create_and_send
    recipes = Recipe.where('created_at < ?', 1.month.ago)
    posts = [] #BlogPost.where('created_at < ?', 1.month.ago)
    Subscription.all.each do |subscription|
      ::UserMailer.newsletter(subscription, recipes, posts).deliver
    end
  end

end
