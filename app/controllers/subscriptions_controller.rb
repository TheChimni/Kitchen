class SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.new params[:subscription]
    if subscription.save
      redirect_to root_path + '#contact', :notice => 'Thankyou, your subscription has been created'
    else
      flash[:error] = "Your subscription could not be created. #{subscription.errors.full_messages.join(', ')}."
      redirect_to root_path + '#contact'
    end
  end
end
