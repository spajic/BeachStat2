class GamesController < ApplicationController
  def index
  	# eager loading - Изначально было Game.all и 919 sql запросов
  	# .includes(:day) => 896 sql
  	# .includes(:day, :results) => 896 sql
  	# .includes(:day, results: [:player]) => 896 sql
  	# helper для получения first_winner => 676 sql
  	# helper's для получения всех игроков => 5 sql
  	# Время загрузки сократилось с 12 секунд до 1 секунды
  	@days = Day.includes(games: [results: [:player]]).all
  	# Game.includes(:day, results: [:player]).all
  end
end
