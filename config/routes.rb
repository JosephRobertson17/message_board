# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  root to: "main#index"

  get "sign_up", to: "registrations#new", as: :sign_up
  post "sign_up", to: "registrations#create"

  get "about", to: "about#index", as: :about
end
