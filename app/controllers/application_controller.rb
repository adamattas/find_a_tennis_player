class ApplicationController < ActionController::Base
  before_action :authenticate_tennis_player!

  protect_from_forgery with: :exception
end
