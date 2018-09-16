Rails.application.routes.draw do
  resources :restaurants
  get 'about' => 'pages/about'
  get 'contact' => 'pages/contact'

  root "restaurants#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end