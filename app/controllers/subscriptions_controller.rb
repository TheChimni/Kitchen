class SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.new params[:subscription]
    if subscription.save
      redirect_to root_path, :notice => 'Thankyou, your subscription has been created'
    else
      # TODO: handle error
    end
  end
end
