Rails3BootstrapDeviseCancan::Application.routes.draw do
  resources :indicators

  resources :indicator_scores

  resources :objective_scores

  resources :perspective_scores

  resources :score_dates

  resources :objectives

  resources :perspectives

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]
end
