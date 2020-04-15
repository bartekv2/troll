Rails.application.routes.draw do
  resources :thefts
  devise_for :users, :controllers => { :sessions => "sessions" }
  root 'thefts#index'
  get 'about' => 'home#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
