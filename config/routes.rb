Rails.application.routes.draw do

  # get 'heroines/search/:q', to: "heroines#search"
  resources :powers, only: [:index, :show]
  resources :heroines, only: [:index, :show, :new, :create, :search]


end
