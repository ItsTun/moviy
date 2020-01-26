Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "home#index"
  get 'country/:slug', to: 'country#index', as: :country_movie
  get 'genre/:slug', to: 'genre#index', as: :genre_movie
  get 'type/:slug', to: 'type#index', as: :type_movie
  get 'movie/:slug', to: 'movie#show', as: :movie_detail
  get 'movies', to: 'movie#index', as: :movie_index
end
