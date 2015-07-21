class Player < ActiveRecord::Base
	has_many :results
	has_many :games, through: :results
	has_many :days, through: :games
	@@players = Player.includes(:results).all.to_a

	def Player.legioners
		Player.where(is_legioner: true).sort!{|p1,p2| p2.days_count <=> p1.days_count}	
	end
	def Player.jackpot
		Player.legioners.collect{|player| player.days_count}.reduce(:+)*200
	end
	def days_count
		results.joins(game: :day).select(:date).distinct.count
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
		( 100 * (1 - more_wins_man_count.to_f / (Player.count-1) ) ).round
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

	def Player.all_sorted_by_place
		@@players.sort{ |p1, p2| p1.place <=> p2.place }
	end

	# Этот метод мне не очень нравится.
	# Изначально всё было сделано с использованием Player.all_sorted_by_place - 
	# всё было идеально красиво по коду, но работало нереально долго.
	# Профилирование показало, по-моему, экспоненциальный рост запросов к БД с 
	# накоплением данных.
	# Пролбема вся была в том, что я толком не умел пользоваться ActiveRecord, поэтому
	# я быстренько выступил с решением проблемы - не считать всё через ActiveRecord в модели,
	# а посчитать всё в ручном режиме в этом методе.
	# Но стоит всё-таки разобраться с ActiveRecord так, чтобы это работало в изначальной
	# идеологии.
	# В частоности, стоит посмотреть на Eager loading.
	def Player.calculate_statistics
		players_count = Player.count
		p_stats = {}		
		# wins_count, loses_count, games_count, wins_to_games_ratio
		Player.all.each { |p| 
			p_stats[p.name] = {'player'=>p, 'wins_count' => p.wins_count, 'loses_count' => p.loses_count}
		}
		p_stats.each { |key, s|
			s['games_count'] = s['wins_count'].to_i + s['loses_count'].to_i
			s['wins_to_games_ratio'] = (100 * (s['wins_count'].to_f / s['games_count'])).round
		}

		# more_wins_man_count
		s_sorted_by_wins = p_stats.values.sort{ |s1, s2| s2['wins_count'] <=> s1['wins_count'] }
		more_wins_man = 0
		s_sorted_by_wins[0]['more_wins_man_count'] = more_wins_man
		for i in 1..(s_sorted_by_wins.size - 1)
			more_wins_man = more_wins_man + 1  
			if s_sorted_by_wins[i]['wins_count'] == s_sorted_by_wins[i-1]['wins_count']
				then 
					s_sorted_by_wins[i]['more_wins_man_count'] = 
						s_sorted_by_wins[i-1]['more_wins_man_count']
				else
					s_sorted_by_wins[i]['more_wins_man_count'] = more_wins_man		
			end
		end

		# more_wins_man_ratio, rating
		p_stats.each { |key, s| 
			s['more_wins_man_ratio'] = 
				( 100 * (1 - s['more_wins_man_count'].to_f / (players_count-1) ) ).round
			s['rating'] = (s['wins_to_games_ratio'] + s['more_wins_man_ratio']) / 2
		}

		# more_rating_man_count, place
		# дополнительно обеспечиваем: при равном рейтинге преимущество по кол-ву игр
		# The block must implement a comparison between a and b, and 
		# return -1, when a follows b, 0 when a and b are equivalent, or +1 if b follows a.
		s_sorted_by_rating = p_stats.values.sort{ |b, a| 
			if a['rating'] > b['rating']  
				1
			elsif a['rating'] < b['rating']
				-1
			elsif a['rating'] == b['rating']
				if a['games_count'] > b['games_count']
					1
				elsif a['games_count'] < b['games_count']
					-1
				else
					0					
				end
			end
		}

		for i in 0..(s_sorted_by_rating.size - 1)
			s_sorted_by_rating[i]['more_rating_man_count'] = i
		end
		p_stats.each { |key, s| 
			s['place'] = 1 + s['more_rating_man_count']
		}
		p_stats_a = p_stats.to_a	
		return p_stats_a.sort{|s1, s2| s1[1]['place'] <=> s2[1]['place']}
	end
end
