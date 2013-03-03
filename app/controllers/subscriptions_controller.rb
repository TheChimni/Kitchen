class SubscriptionsController < ApplicationController
  def create
    # raise params.inspect
    subscription = Subscription.new params[:subscription]
    success = subscription.save
    UserMailer.welcome_email(subscription).deliver if success
    if request.xhr?
      @subscription = success ? Subscription.new : subscription
    else
      if success
        redirect_to root_path + '#contact', :notice => 'Thankyou, your subscription has been created'
      else
        flash[:error] = "Your subscription could not be created. #{subscription.errors.full_messages.join(', ')}."
        redirect_to root_path + '#contact'
      end
    end
  end

  def show
    @show_header = true
    @subscription = Subscription.find(params[:id])
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    if @subscription.destroy
      flash[:notice] = "Your subscription has been deleted."
      redirect_to root_path
    else
      render :show
    end
  end
end
