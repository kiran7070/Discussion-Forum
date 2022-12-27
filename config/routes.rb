Rails.application.routes.draw do
 
  root "discussions#index"
  post "/discussions/:id/like", to: "discussions#like", as: "like"
  resources :discussions
  resources :discussions do
    resources :comments do
      resources :replies
    end
  end

  get "/discussion/:id/pin", to:"discussions#pin", as:"pin"
  get "/discussion/:id/unpin", to:"discussions#unpin", as:"unpin"




  

  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
