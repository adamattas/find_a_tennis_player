Rails.application.routes.draw do
  devise_for :tennis_players
  # Routes for the Tennis_player resource:
  # READ
  get "/tennis_players", :controller => "tennis_players", :action => "index"
  get "/tennis_players/:id", :controller => "tennis_players", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
