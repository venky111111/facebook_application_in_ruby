
Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'posts#index'
  resources :posts 
  resources :likes
  resources :postcomments
end
