Rails.application.routes.draw do
  resources :pages
  resources :movies, only: %i[index show]
  resources :production_companies, only: %i[index show]

  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
