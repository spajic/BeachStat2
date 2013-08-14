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

Players = ['Спаич', 'Прас', 'Баранов', 'Олег', 'Стёпа', 'Федоринин']
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

