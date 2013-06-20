ApotomoMongo::Application.routes.draw do
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
    end

    get 'admin', :on => :member
  end
end