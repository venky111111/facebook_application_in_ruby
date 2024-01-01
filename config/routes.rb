# config/routes.rb
Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'posts#index'
  resources :posts do
    resources :postcomments, only: [:create, :destroy]
    resources :likes
  end
  resources :postcomments do 
    resources :likes
    
  end
  
  get 'pages/index'

end
