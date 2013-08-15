class Player < ActiveRecord::Base
	has_many :results

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
	def more_manly_man_count
		
	end
	def more_manly_man_rating
	end
	def rating
	end
	def more_rating_man_count
	end
	def place
	end
end
