Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root "todo#index"
  # resources :user do
  #   resources :todo
  #   end
  resources :todo
end
