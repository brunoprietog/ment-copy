Rails.application.routes.draw do
  get 'pages/index'
  post :my_endpoint, to: 'pages#my_endpoint'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
end
