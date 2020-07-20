Rails.application.routes.draw do
  resources :searches do
      member do
      patch :create 
    end
  end
  resources :reviews
  resources :wallpapers
  resources :pictures
  resources :image_accommodations
  resources :image_rooms
  devise_for :users
  resources :rooms
  resources :accommodations do
     resources :reviews, except: [:show, :index]
  end

  resources :cities
  resources :categories
  resources :my_accommodations
  resources :search_rooms

  root 'accommodations#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
