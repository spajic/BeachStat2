module GamesHelper
	# На входе массив из 4х результатов - два победителя и два проигравших
	def first_winner(game_results)
		winners = game_results.select{|r| r.win == true}
		winners.first
	end
	def second_winner(game_results)
		winners = game_results.select{|r| r.win == true}
		winners.last
	end
	def first_loser(game_results)
		losers = game_results.select{|r| r.win == false}
		losers.first
	end
	def second_loser(game_results)
		losers = game_results.select{|r| r.win == false}
		losers.last
	end
end
