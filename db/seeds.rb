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

# второй столбец - Легионер или нет
Player.delete_all
Day.delete_all
Game.delete_all
Result.delete_all

Players = [
	['Прас'		, false	],
	['Тёма'		, false	],
	['Саня'		, false	],	
	['Казаков'	, false ],		
	['Спаич'	, false	],
	['Игорь'	, false	],
	['Стёпа'	, false	],
	['Браток'	, true	],
	['Олег'		, true	],
	['Королёв'	, true	]
]
Players.each do |p| 
	player = Player.find_or_create_by_name(p[0])
	player.is_legioner = p[1]
	player.save
end

# День 1 (id = 1)
d1 = Day.create(id:1)
d1.date = '13.05.2015'.to_date
d1.comment = 
	"Открытие сезона. Прохладно. Игоряся выступил с девизом 'Потискаем пупсов!'.
	Пришла Маша, поработала в кафе рядом."
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

# День 2 (id = 2)
d2 = Day.create(id:2)
d2.date = '20.05.2015'.to_date
d2.comment = 
	"Результаты записал Стёпа, потом довспоминали в контакте. 
	15 мая (пт) отменили из-за погоды."
games = [
	[1, 'Казаков'	, 'Тёма'		, 'Браток'	, 'Игорь'		, 15, 12],
	[2, 'Прас'		, 'Стёпа'		, 'Казаков'	, 'Тёма'		, 15, 9],
	[3, 'Прас'		, 'Стёпа'		, 'Саня'	, 'Игорь'		, 15, 9],
	[4, 'Браток'	, 'Тёма'		, 'Прас'	, 'Стёпа'		, 15, 13],
	[5, 'Браток'	, 'Тёма'		, 'Саня'	, 'Казаков'		, 16, 14],
	[6, 'Браток'	, 'Тёма'		, 'Игорь'	, 'Олег'		, 15, 10],
	[7, 'Саня'		, 'Казаков'		, 'Прас'	, 'Стёпа'		, 15, 1],
	[8, 'Саня'		, 'Казаков'		, 'Браток'	, 'Тёма'		, 15, 5],
	[9, 'Саня'		, 'Казаков'		, 'Игорь'	, 'Олег'		, 15, 4],
	[10,'Браток'	, 'Олег'		, 'Прас'	, 'Стёпа'		, 15, 12],
	[11,'Саня'		, 'Казаков'		, 'Браток'	, 'Олег'		, 15, 9],
	[12,'Саня'		, 'Казаков'		, 'Браток'	, 'Олег'		, 15, 9],
	[13,'Саня'		, 'Казаков'		, 'Игорь'	, 'Олег'		, 15, 9]
]
games.each { |game| create_game_in_day_by_array(d2, game) }
d2.save

# День 3 (id = 3)
d3 = Day.create(id:3)
d3.date = '27.05.2015'.to_date
d3.comment = 
	"День 3. И опять среда.
	22 мая (пт) отменили из-за погоды (хотя кто-то вроде всё-таки поиграл)."
games = [
	[1, 'Спаич'		, 'Казаков'		, 'Тёма'	, 'Игорь'		, 16, 14],
	[2, 'Саня'		, 'Стёпа'		, 'Спаич'	, 'Казаков'		, 15, 8],
	[3, 'Тёма'		, 'Королёв'		, 'Саня'	, 'Стёпа'		, 15, 13],
	[4, 'Спаич'		, 'Игорь'		, 'Тёма'	, 'Королёв'		, 15, 8],
	[5, 'Казаков'	, 'Стёпа'		, 'Спаич'	, 'Игорь'		, 15, 13],
	[6, 'Саня'		, 'Тёма'		, 'Казаков'	, 'Стёпа'		, 15, 9],
	[7, 'Саня'		, 'Тёма'		, 'Игорь'	, 'Королёв'		, 15, 11],
	[8, 'Саня'		, 'Тёма'		, 'Спаич'	, 'Стёпа'		, 15, 10],
	[9, 'Спаич'		, 'Королёв'		, 'Казаков'	, 'Игорь'		, 15, 13],
	[10,'Саня'		, 'Тёма'		, 'Спаич'	, 'Королёв'		, 15, 9]
]
games.each { |game| create_game_in_day_by_array(d3, game) }
d3.save
