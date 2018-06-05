class TennisPlayersController < ApplicationController
  def index
    @tennis_players = TennisPlayer.all
  end

  def show
    @tennis_player = TennisPlayer.find(params[:id])
  end
end
