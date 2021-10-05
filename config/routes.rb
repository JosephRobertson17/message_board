# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  root to: "main#index"

  get "sign_up", to: "registrations#new", as: :sign_up
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new", as: :sign_in
  post "sign_in", to: "sessions#create"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  delete "logout", to: "sessions#destroy"

  get "message_boards", to: "chatroom#index"
  post "create_message_boards", to: "chatroom#create"
  post "join_message_boards", to: "chatroom#join"
  delete "leave_message_boards", to: "chatroom#leave"
  post "send_message", to: "message#send_message"

  get "about", to: "about#index", as: :about
end
