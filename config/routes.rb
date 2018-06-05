Rails.application.routes.draw do
  # Routes for the Home_court resource:
  # CREATE
  get "/home_courts/new", :controller => "home_courts", :action => "new"
  post "/create_home_court", :controller => "home_courts", :action => "create"

  # READ
  get "/home_courts", :controller => "home_courts", :action => "index"
  get "/home_courts/:id", :controller => "home_courts", :action => "show"

  # UPDATE
  get "/home_courts/:id/edit", :controller => "home_courts", :action => "edit"
  post "/update_home_court/:id", :controller => "home_courts", :action => "update"

  # DELETE
  get "/delete_home_court/:id", :controller => "home_courts", :action => "destroy"
  #------------------------------

  devise_for :tennis_players
  # Routes for the Tennis_player resource:
  # READ
  get "/tennis_players", :controller => "tennis_players", :action => "index"
  get "/tennis_players/:id", :controller => "tennis_players", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
