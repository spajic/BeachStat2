# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Ожидает game вида 
# [1, 'Спаич', 'Прас', 'Баранов', 'Олег', 15, 11],
# [num_in_day, winner1, winner2, loser1, loser2, win_points, lose_points]
# [0         , 1,       2,       3,      4,      5,          6          ]
def create_game_in_day_by_array(day, game) 
	g = day.games.create(num_in_day: game[0], win_points: game[5], lose_points: game[6])
	g.results.create(player: Player.find_by_name(game[1]), win: true)
	g.results.create(player: Player.find_by_name(game[2]), win: true)
	g.results.create(player: Player.find_by_name(game[3]), win: false)
	g.results.create(player: Player.find_by_name(game[4]), win: false)
end

Players = [
	['Спаич'	, false	],
	['Прас'		, false	],
	['Олег'		, false	],
	['Стёпа'	, false	],
	['Королёв'	, true  ],	
	['Тёма'		, false	],
	['Амбал'	, true	],
	['Саня'		, false	],	
	['Алёхин'	, true	],
	['Казаков'	, false ],		
	['Браток'	, true	]
]
Players.each do |p| 
	player = Player.find_or_create_by_name(p[0])
	player.is_legioner = p[1]
	player.save
end

Day.delete_all
Game.delete_all
Result.delete_all

# День 1 (id = 1)
d1 = Day.create(id:1)
d1.date = '13.05.2015'.to_date
d1.comment = 
	"Открытие сезона. Прохладно. Пришла Маша, поработала в кафе рядом."
games = [
	[1, 'Прас'		, 'Тёма'		, 'Саня'	, 'Казаков'		, 15, 11],
	[2, 'Прас'		, 'Тёма'		, 'Спаич'	, 'Игорь'		, 15, 12],
	[3, 'Саня'		, 'Стёпа'		, 'Прас'	, 'Тёма'		, 15, 7],
	[4, 'Саня'		, 'Стёпа'		, 'Спаич'	, 'Казаков'		, 15, 7],
	[5, 'Саня'		, 'Стёпа'		, 'Игорь'	, 'Тёма'		, 15, 13],
	[6, 'Игорь'		, 'Прас'		, 'Спаич'	, 'Казаков'		, 15, 13],
	[7, 'Саня'		, 'Стёпа'		, 'Игорь'	, 'Прас'		, 15, 12],
	[8, 'Спаич'		, 'Тёма'		, 'Саня'	, 'Стёпа'		, 16, 14],
	[9, 'Стёпа'		, 'Игорь'		, 'Спаич'	, 'Тёма'		, 15, 11],
	[10,'Саня'		, 'Казаков'		, 'Стёпа'	, 'Игорь'		, 15, 9],
	[11,'Саня'		, 'Казаков'		, 'Спаич'	, 'Игорь'		, 15, 8]
]
games.each { |game| create_game_in_day_by_array(d1, game) }
d1.save
