Rails.application.routes.draw do


  post "reservations/create" => "reservations#create"
  get 'reservations/index' => "reservations#index"

  get "reservations/new" => "reservations#new"
  post "reservations/new" => "reservations#new"
  post "reservations/confirm" => "reservations#confirm"
  post "reservations/back" => "reservations#back"

 

  get 'rooms/index' => "rooms#index"
  get "rooms/new" => "rooms#new"
  post "rooms/create" => "rooms#create"
  get "rooms/:id" => "rooms#show"
  get "rooms/:id/edit" => "rooms#edit"
  post "rooms/:id/edit" => "rooms#edit"
  post "rooms/:id/update" =>"rooms#update"
  get "rooms/:id/destroy" => "rooms#destroy"
  post "rooms/:id/destroy" => "rooms#destroy"
  get "search" => "rooms#search"

  resources :rooms

  get 'users/index' => "users#index"
  get "login" => "users#login_form"
  post "login" => "users#login"
  get "logout" => "users#logout"
  get "users/new" => "users#new"
  post "users/create" => "users#create"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  post "users/:id/edit" => "users#edit"
  post "users/:id/update" =>"users#update"
 

  get 'top' => "home#top"





end
