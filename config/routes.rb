ApotomoMongo::Application.routes.draw do
  get "polls/index"

  get "polls/new"

  get "polls/create"

  get "polls/show"

  get "polls/update"

  get "polls/destroy"

  authenticated :user do
    root :to => 'communities#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users

  resources :communities do
    resources :pages

    scope :module => "widgets" do
      resources :bulletins
      resources :forums do
        resources :topics, :posts
      end  
      resources :poll_sets do
        resources :polls
      end 
    end

    get 'admin', :on => :member
  end
end