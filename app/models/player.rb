class Player < ActiveRecord::Base
	has_many :results

	def Player.load_data_for_rating_calculation
		@@players = Player.all.to_a
	end

	def wins_count
		results.where(win: true).count
	end
	def loses_count
		results.where(win: false).count
	end
	def games_count
		results.count
	end
	def wins_to_games_ratio
		(100 * (wins_count.to_f / games_count)).round
	end
	def more_wins_man_count
		@@players.count {|p| p.wins_count > wins_count}
	end
	def more_wins_man_ratio
		( 100 * (1 - more_wins_man_count.to_f / Player.count ) ).round
	end
	def rating
		(wins_to_games_ratio + more_wins_man_ratio) / 2
	end
	def more_rating_man_count
		@@players.count {|p| p.rating > rating}
	end
	def place
		1 + more_rating_man_count
	end
end
