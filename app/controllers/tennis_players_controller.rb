class TennisPlayersController < ApplicationController
  def index
    @tennis_players = TennisPlayer.page(params[:page]).per(10)
  end

  def show
    @tennis_player = TennisPlayer.find(params[:id])
  end
end
