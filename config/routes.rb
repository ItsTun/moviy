Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "home#index"
  get 'country/:name', to: 'country#index', as: :country_movie
  get 'genre/:name', to: 'genre#index', as: :genre_movie
  get 'type/:name', to: 'type#index', as: :type_movie
  get 'movie/:name', to: 'movie#show', as: :movie_detail
end
