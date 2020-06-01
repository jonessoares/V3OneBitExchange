Rails.application.routes.draw do
  root 'exchanges#index'
  #get 'exchanges/index'
  get 'convert', to: 'exchanges#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
