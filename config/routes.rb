Rails.application.routes.draw do
  resources :thefts
  devise_for :users
  root 'thefts#index'
  get 'about' => 'home#about'
  mount ActionCable.server => "/cable"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
