Kitchen::Application.routes.draw do
  devise_for :users

  resources :recipes do
    collection do
      get 'search'
      get 'lookup'
    end
    resources :recipe_photos, :except => [:index, :show]
  end

  resources :blog_posts, :path => 'blog'

  resources :classes
  resources :subscriptions, :only => [:create, :show, :destroy]

  root :to => 'home#index'
end
