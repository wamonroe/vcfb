# frozen_string_literal: true

Rails.application.routes.draw do
  resources :authors
  resources :cities
  resources :continents
  resources :countries
  resources :posts
end
