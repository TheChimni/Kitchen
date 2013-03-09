class NewsletterManager

  def create_and_send
    Subscription.all.each do |subscription|
      puts "Sending newsletter to #{subscription.email}..."
      ::UserMailer.newsletter(subscription, recipes, posts).deliver
    end
  end

  def create_and_send_test(email)
    ::UserMailer.newsletter(::Subscription.new(:email => email), recipes, posts).deliver
  end

  def create_and_preview(email)
    ::UserMailer.newsletter(::Subscription.new(:email => email), recipes, posts)
  end

  def recipes
    Recipe.where('created_at > ?', 1.month.ago)
  end

  def posts
    [] #BlogPost.where('created_at > ?', 1.month.ago)
  end

end
