Rails3BootstrapDeviseCancan::Application.routes.draw do
  
  resources :operations

  match "raw_data_scores/prepmassiveInsertion/:date_id" => "raw_data_scores#prepmassiveInsertion", :as => :prepmassiveInsertion
  resources :raw_data_scores

  resources :raw_data

  match "indicators/emancipate/:father/:son" => "indicators#emancipate", :as => :emancipate
  match "indicators/fill" => "indicators#fill", :as => :fill

  resources :indicators

  resources :indicator_scores

  resources :objective_scores

  resources :perspective_scores

  match "score_dates/setgoals/:id" => "score_dates#setgoals", :as => :setgoals
  match "score_dates/filloperators/:id" => "score_dates#filloperators", :as => :filloperators
  resources :score_dates

  resources :objectives

  resources :perspectives

  authenticated :user do
    root :to => 'perspectives#index'
  end
  root :to => "perspectives#index"
  devise_for :users
  resources :users, :only => [:show, :index]
end
