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
	'Амбал',
	'Гоша',
	'Нечипур',
	'Тимофей',
	'Саня',
	'Алёхин',
	'Казаков',
	'Браток'
]
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

# День 3 
d3 = Day.create(id:3)
d3.date = '20.05.2013'.to_date
d3.comment = 
	"Внезапно выяснилось, что у нас площадка с 8ми часов.
	Играли на две площадки в восьмером.
	В пол-десятого зарядил ливень, но мы уже были в раздевалке.
	Греться поехали в Журфак, что около Стёпы"
games = [
	[1, 'Спаич'		, 'Королёв'		, 'Стёпа'	, 'Гоша'		, 15, 12	],
	[2, 'Саня'		, 'Тимофей'		, 'Нечипур'	, 'Олег'		, 15, 12	],
	[3, 'Саня'		, 'Тимофей'		, 'Спаич'	, 'Королёв'		, 15, 10	],
	[4, 'Нечипур'	, 'Олег'		, 'Стёпа'	, 'Гоша'		, 15, 7		],
	[5, 'Спаич'		, 'Королёв'		, 'Стёпа'	, 'Гоша'		, 15, 13	],
	[6, 'Саня'		, 'Тимофей'		, 'Нечипур'	, 'Олег'		, 15, 10 	],
	[7, 'Спаич'		, 'Королёв'		, 'Саня'	, 'Тимофей'		, 15, 6 	],
	[8, 'Стёпа'		, 'Гоша'		, 'Нечипур'	, 'Олег'		, 15, 8 	],
	[9, 'Стёпа'		, 'Гоша'		, 'Спаич'	, 'Королёв'		, 15, 10	],
	[10,'Нечипур'	, 'Олег'		, 'Саня'	, 'Тимофей'		, 15, 12	],
	[11,'Саня'		, 'Тимофей'		, 'Спаич'	, 'Королёв'		, 15, 10	],
	[12,'Нечипур'	, 'Олег'		, 'Саня'	, 'Тимофей'		, 15, 12	],
]
games.each { |game| create_game_in_day_by_array(d3, game) }
d3.save


# День 4 
d4 = Day.create(id:4)
d4.date = '24.05.2013'.to_date
d4.comment = 
	"На Дерибасовской опять идут дожди, на Дружба-бич хорошая погода.
	Были серьёзные опасения насчёт дождя, за час до игры в Дружбе лило как из ведра.
	Но в наше время, как обычно, всё более-менее развеяло.
	Внезапно выяснилось, что у нас не 1я площадка, а 3я."
games = [
	[1, 'Тёма'		, 'Казаков'		, 'Прас'	, 'Алёхин'		, 15, 13	],
	[2, 'Казаков'	, 'Тёма'		, 'Спаич'	, 'Прас'		, 15, 13	],
	[3, 'Тёма'		, 'Казаков'		, 'Алёхин'	, 'Стёпа'		, 15, 7		],
	[4, 'Тёма'		, 'Казаков'		, 'Спаич'	, 'Прас'		, 15, 9		],
	[5, 'Тёма'		, 'Казаков'		, 'Алёхин'	, 'Стёпа'		, 15, 13	],
	[6, 'Прас'		, 'Стёпа'		, 'Тёма'	, 'Казаков'		, 15, 13 	],
	[7, 'Спаич'		, 'Саня'		, 'Прас'	, 'Стёпа'		, 15, 9 	],
	[8, 'Спаич'		, 'Саня'		, 'Алёхин'	, 'Стёпа'		, 15, 12 	],
	[9, 'Спаич'		, 'Саня'		, 'Алёхин'	, 'Стёпа'		, 15, 9		]
]
games.each { |game| create_game_in_day_by_array(d4, game) }
d4.save

# День 5
d5 = Day.create(id:5)
d5.date = '27.05.2013'.to_date
d5.comment = 
	"Погода была не жаркая, с довольно ощутимым ветром.
	Саня под впечатлением от Мытищ был почти неудержим,
	хотя один раз мы с Тёмой его одолели.
	Видимо, из-за ветра были довольно эпичные серии.
	Например, камбек пары Прас-Подлевских vs Олег-Казаков с 3-12 на 15-13 (есть видео)"
games = [
	[1, 'Прас'		, 'Саня'		, 'Олег'	, 'Казаков'		, 15, 8 	],
	[2, 'Прас'		, 'Саня'		, 'Спаич'	, 'Тёма'		, 15, 9		],
	[3, 'Прас'		, 'Саня'		, 'Олег'	, 'Казаков'		, 15, 13	],
	[4, 'Спаич'		, 'Тёма'		, 'Прас'	, 'Саня'		, 15, 13	],
	[5, 'Спаич'		, 'Тёма'		, 'Олег'	, 'Казаков'		, 15, 8		],
	[6, 'Прас'		, 'Саня'		, 'Спаич'	, 'Тёма'		, 15, 11 	],
	[7, 'Прас'		, 'Саня'		, 'Олег'	, 'Казаков'		, 15, 8 	],
	[8, 'Прас'		, 'Саня'		, 'Спаич'	, 'Тёма'		, 15, 11 	],
	[9, 'Прас'		, 'Саня'		, 'Олег'	, 'Казаков'		, 15, 9		],
	[10,'Спаич'		, 'Саня'		, 'Олег'	, 'Казаков'		, 15, 13	]
]
games.each { |game| create_game_in_day_by_array(d5, game) }
d5.save

# День 6
d6 = Day.create(id:6)
d6.date = '31.05.2013'.to_date
d6.comment = 
	"День в большей степени запомнился нашествием плотоядных мошек.
	Реально невозможно было сидеть на одном месте.
	После них остались два десятка волдырей на любой цвет и размер"
games = [
	[1, 'Спаич'		, 'Нечипур'		, 'Прас'	, 'Тёма'		, 15, 11 	],
	[2, 'Спаич'		, 'Нечипур'		, 'Браток'	, 'Королёв'		, 15, 6		],
	[3, 'Спаич'		, 'Нечипур'		, 'Прас'	, 'Тёма'		, 15, 11	],
	[4, 'Браток'	, 'Королёв'		, 'Спаич'	, 'Нечипур'		, 15, 13	],
	[5, 'Саня'		, 'Прас'		, 'Браток'	, 'Королёв'		, 15, 11	],
	[6, 'Саня'		, 'Прас'		, 'Тёма'	, 'Нечипур'		, 15, 8 	],
	[7, 'Саня'		, 'Прас'		, 'Спаич'	, 'Королёв'		, 15, 10 	],
	[8, 'Саня'		, 'Прас'		, 'Браток'	, 'Тёма'		, 15, 9 	],
	[9, 'Спаич'		, 'Нечипур'		, 'Саня'	, 'Прас'		, 15, 13	],
	[10,'Спаич'		, 'Нечипур'		, 'Браток'	, 'Королёв'		, 15, 11	],
	[11,'Саня'		, 'Тёма'		, 'Спаич'	, 'Нечипур'		, 15, 10	],
	[12,'Саня'		, 'Тёма'		, 'Браток'	, 'Королёв'		, 15, 8 	],
	[12,'Саня'		, 'Тёма'		, 'Браток'	, 'Королёв'		, 16, 14 	]
]
games.each { |game| create_game_in_day_by_array(d6, game) }
d6.save

# День 7
d7 = Day.create(id:7)
d7.date = '03.06.2013'.to_date
d7.comment = 
	"Я был в командировке в Питере, результаты любезно записал Нечипур."
games = [
	[1, 'Саня'		, 'Казаков'		, 'Прас'	, 'Нечипур'		, 15, 8 	],
	[2, 'Саня'		, 'Казаков'		, 'Прас'	, 'Тёма'		, 16, 14	],
	[3, 'Олег'		, 'Нечипур'		, 'Саня'	, 'Казаков'		, 15, 9		],
	[4, 'Олег'		, 'Нечипур'		, 'Прас'	, 'Тёма'		, 15, 11	],
	[5, 'Саня'		, 'Казаков'		, 'Олег'	, 'Нечипур'		, 15, 11	],
	[6, 'Тёма'		, 'Прас'		, 'Саня'	, 'Казаков'		, 15, 13 	],
	[7, 'Саня'		, 'Казаков'		, 'Тёма'	, 'Прас'		, 15, 13 	]
]
games.each { |game| create_game_in_day_by_array(d7, game) }
d7.save

# День 8
d8 = Day.create(id:8)
d8.date = '07.06.2013'.to_date
d8.comment = 
	"Я ещё не вернулся из Питера. 
	Результаты получены методом исторической реконструкции."
games = [
	[1, 'Тёма'		, 'Саня'		, 'Прас'	, 'Казаков'		, 16, 14 	],
	[2, 'Тёма'		, 'Саня'		, 'Прас'	, 'Казаков'		, 16, 14 	],
	[3, 'Тёма'		, 'Саня'		, 'Прас'	, 'Казаков'		, 15, 13 	],
	[4, 'Тёма'		, 'Саня'		, 'Прас'	, 'Казаков'		, 16, 14 	],
	[5, 'Прас'		, 'Казаков'		, 'Тёма'	, 'Саня'		, 16, 14 	],
	[6, 'Прас'		, 'Казаков'		, 'Тёма'	, 'Алёхин'		, 15, 10 	],
	[7, 'Тёма'		, 'Саня'		, 'Королёв'	, 'Алёхин'		, 16, 14 	],
	[8, 'Тёма'		, 'Саня'		, 'Королёв'	, 'Алёхин'		, 16, 14 	],
	[9, 'Тёма'		, 'Саня'		, 'Королёв'	, 'Алёхин'		, 16, 14 	],
	[10,'Тёма'		, 'Саня'		, 'Королёв'	, 'Алёхин'		, 15, 10 	]

]
games.each { |game| create_game_in_day_by_array(d8, game) }
d8.save