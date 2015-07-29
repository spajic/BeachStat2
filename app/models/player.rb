class Player < ActiveRecord::Base
	has_many :results
	has_many :games, through: :results
	has_many :days, through: :games
	@@players = Player.includes(:results, :games, :days).all.to_a
	@@players_count = Player.count

	def Player.legioners
		Player.where(is_legioner: true).sort!{|p1,p2| p2.days_count <=> p1.days_count}	
	end
	def Player.jackpot
		Player.legioners.collect{|player| player.days_count}.reduce(:+)*200
	end
	def days_count
		@days ||= days.distinct.count
	end
	def wins_count
		@wins ||= results.where(win: true).count
	end
	def loses_count
		@loses ||= results.where(win: false).count
	end
	def games_count
		@results_count ||= results.count
	end
	def wins_to_games_ratio
		@wins_to_games_ratio ||= (100 * (wins_count / games_count.to_f)).round
	end
	def more_wins_man_count
		@more_wins_man_count ||= @@players.count {|p| p.wins_count > wins_count}
	end
	def more_wins_man_ratio
		@more_wind_man_ratio ||= ( 100 * (1 - more_wins_man_count.to_f / (@@players_count-1) ) ).round
	end
	def rating
		@rating ||=	(wins_to_games_ratio + more_wins_man_ratio) / 2
	end
	def more_rating_man_count
		@more_rating_man_count ||=	@@players.count {|p| p.rating > rating}
	end
	def place
		@place ||= 1 + more_rating_man_count
	end

	def Player.all_sorted_by_place
		# дополнительно обеспечиваем: при равном рейтинге преимущество по кол-ву игр
		
		# The block must implement a comparison between a and b, and 
		# return -1, when a follows b, 0 when a and b are equivalent, or +1 if b follows a.
		@@players.sort{ |b, a| 
			if a.rating > b.rating
				1
			elsif a.rating < b.rating
				-1
			elsif a.rating == b.rating
				if a.games_count > b.games_count
					1
				elsif a.games_count < b.games_count
					-1
				else
					0					
				end
			end
		}
	end
end
