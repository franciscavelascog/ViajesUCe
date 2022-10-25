# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :messages
  resources :rooms
  devise_for :users
  root 'static_pages#landingpage'
  # root 'static_pages#home'
  get 'static_pages/home', as: 'home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'application#hello'
  get '/publications', to: 'publications#index'
  get 'publications/user/:user_id', to: 'publications#owner_publications', as: 'owner_publications'
  get '/publications/new', to: 'publications#new'
  post '/publications', to: 'publications#create'
  get '/publication/:id', to: 'publications#show', as: 'publication'
  get '/publications/:id/edit', to: 'publications#edit', as: 'edit_publication'
  patch '/publication/:id', to: 'publications#update'
  delete '/publication/:id', to: 'publications#delete'

  delete '/user/:id', to: 'users#delete', as: 'delete_user'

  get '/resenas/:user_id', to: 'resenas#index', as: 'user_resenas'
  get '/resenas/show/:user_id', to: 'resenas#show', as: 'show_resenas'
  get '/resenas/new/:user_id', to: 'resenas#new', as: 'new_resena'
  post '/resenas/:user_id', to: 'resenas#create'
  get '/resenas/:id/edit', to: 'resenas#edit', as: 'edit_resena'
  patch '/resena/:id', to: 'resena#update'
  delete '/resena/:id', to: 'resenas#destroy', as: 'destroy_resena'
  patch '/solicituds/:id', to: 'solicituds#approve', as: 'approve_solicitud'
  delete '/solicituds/:id', to: 'solicituds#reject', as: 'reject_solicitud'

  resources :solicituds, only: %i[create destroy index approve reject]

  resources :users
  resources :publications do
    resources :comments
  end
end
