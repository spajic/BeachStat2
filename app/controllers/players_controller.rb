class PlayersController < ApplicationController
  def index
  	@players = Player.all_sorted_by_place
  end
end
