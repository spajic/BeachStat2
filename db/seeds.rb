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
	'Спаич', 
	'Прас', 
	'Баранов', 
	'Олег', 
	'Стёпа', 
	'Федоринин', 
	'Королёв',
	'Тёма',
	'Амбал']
Players.each {|p| Player.find_or_create_by_name(p)}

Day.delete_all
Game.delete_all
Result.delete_all

# День 1 (id = 1)
d1 = Day.create(id:1)
d1.date = '13.05.2013'.to_date
d1.comment = 
	"Очень тёплая погода. 
	Тепло, хорошо. Не самый плохой уровени волейбола для открытия сезона"
games = [
	[1, 'Спаич'		, 'Прас'		, 'Баранов'	, 'Олег'		, 15, 11],
	[2, 'Спаич'		, 'Прас'		, 'Стёпа'	, 'Федоринин'	, 15, 4 ],
	[3, 'Баранов'	, 'Олег'		, 'Спаич'	, 'Прас'		, 15, 13],
	[4, 'Стёпа'		, 'Федоринин'	, 'Баранов'	, 'Олег'		, 15, 10],
	[5, 'Стёпа'		, 'Федоринин'	, 'Спаич'	, 'Прас'		, 15, 10],
	[6, 'Стёпа'		, 'Федоринин'	, 'Баранов'	, 'Олег'		, 15, 8 ],
	[7, 'Стёпа'		, 'Федоринин'	, 'Спаич'	, 'Прас'		, 15, 9 ],
	[8, 'Баранов'	, 'Олег'		, 'Стёпа'	, 'Федоринин'	, 15, 13],
	[9, 'Спаич'		, 'Прас'		, 'Баранов'	, 'Олег'		, 15, 12],
    [10,'Баранов'	, 'Олег'		, 'Спаич'	, 'Прас'		, 15, 13]
]
games.each { |game| create_game_in_day_by_array(d1, game) }
d1.save

# День 2 (id = 2)
d2 = Day.create(id:2)
d2.date = '17.05.2013'.to_date
d2.comment = 
	"В первой половине дул довольно сильный ветер, потом стих.
	Народ посменно играл на соседней площадке с девчонками.
	После игры забурились в му-му. Сидя там, подумали, что надоело.
	Кстати, после му-му рубанули в Парк Горького ненадолго."
games = [
	[1, 'Королёв'	, 'Тёма'		, 'Спаич'	, 'Баранов'		, 15, 9		],
	[2, 'Амбал'		, 'Прас'		, 'Тёма'	, 'Королёв'		, 15, 11	],
	[3, 'Спаич'		, 'Олег'		, 'Амбал'	, 'Прас'		, 15, 12	],
	[4, 'Баранов'	, 'Тёма'		, 'Спаич'	, 'Олег'		, 15, 9		],
	[5, 'Баранов'	, 'Тёма'		, 'Амбал'	, 'Королёв'		, 15, 10	],
	[6, 'Спаич'		, 'Прас'		, 'Баранов'	, 'Тёма'		, 15, 13 	],
	[7, 'Стёпа'		, 'Прас'		, 'Амбал'	, 'Олег'		, 15, 12 	],
	[8, 'Спаич'		, 'Прас'		, 'Тёма'	, 'Королёв'		, 15, 12	],
	[9, 'Спаич'		, 'Прас'		, 'Баранов'	, 'Тёма'		, 15, 12	]
]
games.each { |game| create_game_in_day_by_array(d2, game) }
d2.save


