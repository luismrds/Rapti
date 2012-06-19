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

  match "score_dates/setindicatorsgoals/:id" => "score_dates#setindicatorsgoals", :as => :setindicatorsgoals
  match "score_dates/filloperands/:id" => "score_dates#filloperands", :as => :filloperands
  match "score_dates/setindicatorsscores/:id" => "score_dates#setindicatorsscores", :as => :setindicatorsscores
  match "score_dates/setperspectivesscores/:id" => "score_dates#setperspectivesscores", :as => :setperspectivesscores
  match "score_dates/setobjectivesscores/:id" => "score_dates#setobjectivesscores", :as => :setobjectivesscores
  resources :score_dates

  match "objectives/demoshow" => "objectives#demoshow", :as => :demoshowobjectives 
  match "objectives/explore" => "objectives#explore", :as => :exploreobjectives
  resources :objectives

  match "perspectives/strategyMap" => "perspectives#strategyMap", :as => :strategyMap
  resources :perspectives

  authenticated :user do
    root :to => 'perspectives#strategyMap'
  end
  root :to => "perspectives#strategyMap"
  devise_for :users
  resources :users, :only => [:show, :index]
end
