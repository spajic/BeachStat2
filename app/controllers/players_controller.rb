class PlayersController < ApplicationController
  def index
  	@players = Player.calculate_statistics
  end
end
