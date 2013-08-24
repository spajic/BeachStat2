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
	['Баранов'	, true	],
	['Олег'		, false	],
	['Стёпа'	, false	],
	['Федоринин', true	],
	['Королёв'	, true  ],	
	['Тёма'		, false	],
	['Амбал'	, true	],
	['Гоша'		, true	],
	['Нечипур'	, false	],	
	['Тимофей'	, true	],
	['Саня'		, false	],	
	['Алёхин'	, true	],
	['Казаков'	, false ],		
	['Браток'	, true	],
	['Битёк'	, true	],
	['Щукин'	, true	],
	['Балу'		, true	]
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
d1.date = '13.05.2013'.to_date
d1.comment = 
	"Очень тёплая погода. 
	Тепло, хорошо. Не самый плохой уровень волейбола для открытия сезона"
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

# День 9
d9 = Day.create(id:9)
d9.date = '10.06.2013'.to_date
d9.comment =  ""
games = [
	[1, 'Саня'		, 'Казаков'		, 'Спаич'	, 'Королёв'		, 15, 8 	],
	[2, 'Саня'		, 'Казаков'		, 'Прас'	, 'Стёпа'		, 15, 12 	],
	[3, 'Спаич'		, 'Тёма'		, 'Саня'	, 'Казаков'		, 15, 10 	],
	[4, 'Спаич'		, 'Тёма'		, 'Прас'	, 'Королёв'		, 15, 11 	],
	[5, 'Прас'		, 'Стёпа'		, 'Спаич'	, 'Тёма'		, 15, 13 	],
	[6, 'Саня'		, 'Казаков'		, 'Прас'	, 'Стёпа'		, 15, 12 	],
	[7, 'Саня'		, 'Казаков'		, 'Спаич'	, 'Королёв'		, 15, 7 	],
	[8, 'Саня'		, 'Казаков'		, 'Королёв'	, 'Прас'		, 15, 13 	],
	[9, 'Саня'		, 'Казаков'		, 'Стёпа'	, 'Королёв'		, 15, 12 	],
	[10,'Саня'		, 'Казаков'		, 'Спаич'	, 'Тёма'		, 15, 10 	],
	[11,'Саня'		, 'Казаков'		, 'Прас'	, 'Стёпа'		, 15, 10 	],
	[12,'Тёма'		, 'Королёв'		, 'Спаич'	, 'Стёпа'		, 15, 12 	]

]
games.each { |game| create_game_in_day_by_array(d9, game) }
d9.save

# День 10
d10 = Day.create(id:10)
d10.date = '14.06.2013'.to_date
d10.comment =  ""
games = [
	[1, 'Тёма'		, 'Казаков'		, 'Спаич'	, 'Нечипур'		, 15, 13 	],
	[2, 'Тёма'		, 'Казаков'		, 'Спаич'	, 'Прас'		, 15, 8 	],
	[3, 'Тёма'		, 'Казаков'		, 'Спаич'	, 'Нечипур'		, 15, 10 	],
	[4, 'Прас'		, 'Стёпа'		, 'Тёма'	, 'Казаков'		, 15, 10 	],
	[5, 'Прас'		, 'Стёпа'		, 'Спаич'	, 'Нечипур'		, 15, 11 	],
	[6, 'Прас'		, 'Стёпа'		, 'Казаков'	, 'Тёма'		, 15, 10 	],
	[7, 'Прас'		, 'Стёпа'		, 'Спаич'	, 'Нечипур'		, 16, 14 	],
	[8, 'Прас'		, 'Стёпа'		, 'Казаков'	, 'Тёма'		, 15, 10 	],
	[9, 'Спаич'		, 'Нечипур'		, 'Прас'	, 'Стёпа'		, 15, 10 	],
	[10,'Спаич'		, 'Нечипур'		, 'Казаков'	, 'Тёма'		, 15, 13 	]

]
games.each { |game| create_game_in_day_by_array(d10, game) }
d10.save

# День 11
d11 = Day.create(id:11)
d11.date = '17.06.2013'.to_date
d11.comment =  ""
games = [
	[1, 'Нечипур'	, 'Тёма'		, 'Спаич'	, 'Казаков'		, 15, 13 	],
	[2, 'Саня'		, 'Прас'		, 'Нечипур'	, 'Тёма'		, 15, 8 	],
	[3, 'Саня'		, 'Прас'		, 'Олег'	, 'Стёпа'		, 15, 13 	],
	[4, 'Саня'		, 'Прас'		, 'Спаич'	, 'Казаков'		, 15, 11 	],
	[5, 'Саня'		, 'Прас'		, 'Тёма'	, 'Нечипур'		, 15, 12 	],
	[6, 'Стёпа'		, 'Олег'		, 'Спаич'	, 'Казаков'		, 15, 8 	],
	[7, 'Стёпа'		, 'Олег'		, 'Саня'	, 'Прас'		, 15, 9 	],
	[8, 'Стёпа'		, 'Олег'		, 'Нечипур'	, 'Тёма'		, 15, 10 	],
	[9, 'Саня'		, 'Прас'		, 'Спаич'	, 'Казаков'		, 15, 9 	],
	[10,'Саня'		, 'Прас'		, 'Стёпа'	, 'Олег'		, 15, 8 	],
	[11,'Саня'		, 'Прас'		, 'Нечипур'	, 'Тёма'		, 15, 10 	]

]
games.each { |game| create_game_in_day_by_array(d11, game) }
d11.save

# День 12
d12 = Day.create(id:12)
d12.date = '21.06.2013'.to_date
d12.comment =  "Перед болт-пати 1"
games = [
	[1, 'Прас'		, 'Тёма'		, 'Спаич'	, 'Нечипур'		, 15, 13 	],
	[2, 'Прас'		, 'Тёма'		, 'Спаич'	, 'Казаков'		, 15, 7 	],
	[3, 'Спаич'		, 'Нечипур'		, 'Прас'	, 'Тёма'		, 16, 14 	],
	[4, 'Саня'		, 'Казаков'		, 'Спаич'	, 'Нечипур'		, 16, 14 	],
	[5, 'Саня'		, 'Казаков'		, 'Прас'	, 'Тёма'		, 15, 12 	],
	[6, 'Спаич'		, 'Олег'		, 'Саня'	, 'Казаков'		, 15, 12 	],
	[7, 'Нечипур'	, 'Тёма'		, 'Саня'	, 'Казаков'		, 15, 13 	],
	[8, 'Нечипур'	, 'Тёма'		, 'Олег'	, 'Прас'		, 15, 12 	],
	[9, 'Нечипур'	, 'Тёма'		, 'Спаич'	, 'Саня'		, 15, 8 	],
	[10, 'Нечипур'	, 'Олег'		, 'Прас'	, 'Казаков'		, 15, 12 	]

]
games.each { |game| create_game_in_day_by_array(d12, game) }
d12.save

# День 13
d13 = Day.create(id:13)
d13.date = '24.06.2013'.to_date
d13.comment =  
"Реконструкция от Тёмы.
Пётр + Саня - 9 побед, 1 поражение
Битёк + Нечипур - 3 победы, 4 поражения
Тёма + Серёга - 7 поражений
Всем играм присваиваю счёт 15-10"
games = [
	[1, 'Казаков'		, 'Саня'		, 'Битёк'	, 'Нечипур'		, 15, 10 	],
	[2, 'Казаков'		, 'Саня'		, 'Битёк'	, 'Нечипур'		, 15, 10 	],
	[3, 'Казаков'		, 'Саня'		, 'Битёк'	, 'Нечипур'		, 15, 10 	],
	[4, 'Казаков'		, 'Саня'		, 'Битёк'	, 'Нечипур'		, 15, 10 	],
	[5, 'Казаков'		, 'Саня'		, 'Прас'	, 'Тёма'		, 15, 10 	],
	[6, 'Казаков'		, 'Саня'		, 'Прас'	, 'Тёма'		, 15, 10 	],
	[7, 'Казаков'		, 'Саня'		, 'Прас'	, 'Тёма'		, 15, 10 	],
	[8, 'Казаков'		, 'Саня'		, 'Прас'	, 'Тёма'		, 15, 10 	],
	[9, 'Казаков'		, 'Саня'		, 'Прас'	, 'Тёма'		, 15, 10 	],
	[10,'Битёк'			, 'Нечипур'		, 'Казаков'	, 'Саня'		, 15, 10 	],
	[11,'Битёк'			, 'Нечипур'		, 'Прас'	, 'Тёма'		, 15, 10 	],
	[12,'Битёк'			, 'Нечипур'		, 'Прас'	, 'Тёма'		, 15, 10 	]
]
games.each { |game| create_game_in_day_by_array(d13, game) }
d13.save

# День 14
d14 = Day.create(id:14)
d14.date = '28.06.2013'.to_date
d14.comment =  "Реконструкция от Битька. Всем 15-10"
games = [
	[1, 'Тёма'			, 'Битёк'		, 'Прас'	, 'Амбал'		, 15, 10 	],
	[2, 'Прас'			, 'Щукин'		, 'Тёма'	, 'Битёк'		, 15, 10 	],
	[3, 'Стёпа'			, 'Амбал'		, 'Прас'	, 'Щукин'		, 15, 10 	],
	[4, 'Нечипур'		, 'Олег'		, 'Стёпа'	, 'Амбал'		, 15, 10 	],
	[5, 'Тёма'			, 'Битёк'		, 'Нечипур'	, 'Олег'		, 15, 10 	],
	[6, 'Прас'			, 'Щукин'		, 'Тёма'	, 'Битёк'		, 15, 10 	],
	[7, 'Прас'			, 'Щукин'		, 'Стёпа'	, 'Амбал'		, 15, 10 	],
	[8, 'Прас'			, 'Щукин'		, 'Нечипур'	, 'Олег'		, 15, 10 	],
	[9, 'Тёма'			, 'Битёк'		, 'Стёпа'	, 'Амбал'		, 15, 10 	],
	[10,'Щукин'			, 'Олег'		, 'Тёма'	, 'Битёк'		, 15, 10 	]
]
games.each { |game| create_game_in_day_by_array(d14, game) }
d14.save

# День 15
d15 = Day.create(id:15)
d15.date = '01.07.2013'.to_date
d15.comment =  ""
games = [
	[1, 'Саня'			, 'Казаков'		, 'Спаич'	, 'Прас'		, 15, 13 	],
	[2, 'Саня'			, 'Казаков'		, 'Королёв'	, 'Олег'		, 15, 10 	],
	[3, 'Саня'			, 'Казаков'		, 'Спаич'	, 'Прас'		, 15, 13 	],
	[4, 'Саня'			, 'Казаков'		, 'Королёв'	, 'Олег'		, 15, 6 	],
	[5, 'Саня'			, 'Казаков'		, 'Спаич'	, 'Прас'		, 15, 12 	],
	[6, 'Саня'			, 'Казаков'		, 'Олег'	, 'Королёв'		, 15, 11 	],
	[7, 'Саня'			, 'Казаков'		, 'Спаич'	, 'Прас'		, 15, 12 	],
	[8, 'Королёв'		, 'Олег'		, 'Саня'	, 'Казаков'		, 16, 14 	],
	[9, 'Спаич'			, 'Прас'		, 'Королёв'	, 'Олег'		, 16, 14 	],
	[10,'Спаич'			, 'Прас'		, 'Королёв'	, 'Олег'		, 15, 7 	]
]
games.each { |game| create_game_in_day_by_array(d15, game) }
d15.save

# День 16
d16 = Day.create(id:16)
d16.date = '05.07.2013'.to_date
d16.comment =  ""
games = [
	[1, 'Спаич'			, 'Казаков'		, 'Тёма'	, 'Прас'		, 15, 8 	],
	[2, 'Тёма'			, 'Прас'		, 'Браток'	, 'Битёк'		, 16, 14 	],
	[3, 'Тёма'			, 'Прас'		, 'Спаич'	, 'Казаков'		, 15, 12 	],
	[4, 'Тёма'			, 'Прас'		, 'Браток'	, 'Битёк'		, 15, 10 	],
	[5, 'Спаич'			, 'Казаков'		, 'Тёма'	, 'Прас'		, 15, 10 	],
	[6, 'Браток'		, 'Битёк'		, 'Спаич'	, 'Казаков'		, 15, 13 	],
	[7, 'Прас'			, 'Тёма'		, 'Браток'	, 'Битёк'		, 15, 8 	],
	[8, 'Прас'			, 'Тёма'		, 'Спаич'	, 'Казаков'		, 15, 13 	],
	[9, 'Прас'			, 'Тёма'		, 'Браток'	, 'Битёк'		, 15, 8 	],
	[10,'Спаич'			, 'Казаков'		, 'Прас'	, 'Тёма'		, 16, 14 	]
]
games.each { |game| create_game_in_day_by_array(d16, game) }
d16.save

# День 17
d17 = Day.create(id:17)
d17.date = '08.07.2013'.to_date
d17.comment =  ""
games = [
	[1, 'Олег'			, 'Прас'		, 'Спаич'	, 'Казаков'		, 15, 13 	],
	[2, 'Тимофей'		, 'Битёк'		, 'Олег'	, 'Прас'		, 15, 8 	],
	[3, 'Тимофей'		, 'Битёк'		, 'Спаич'	, 'Казаков'		, 16, 14 	],
	[4, 'Олег'			, 'Прас'		, 'Тимофей'	, 'Битёк'		, 15, 13 	],
	[5, 'Олег'			, 'Прас'		, 'Спаич'	, 'Казаков'		, 15, 11 	],
	[6, 'Олег'			, 'Прас'		, 'Тимофей'	, 'Битёк'		, 15, 11 	],
	[7, 'Олег'			, 'Прас'		, 'Спаич'	, 'Казаков'		, 15, 12 	],
	[8, 'Олег'			, 'Прас'		, 'Тимофей'	, 'Битёк'		, 15, 11 	],
	[9, 'Олег'			, 'Прас'		, 'Спаич'	, 'Казаков'		, 15, 9 	],
	[10,'Олег'			, 'Прас'		, 'Тимофей'	, 'Битёк'		, 16, 14 	]
]
games.each { |game| create_game_in_day_by_array(d17, game) }
d17.save

# День 18
d18 = Day.create(id:18)
d18.date = '12.07.2013'.to_date
d18.comment =  
	"Играли с плохо себя чувствующим Прасом. Потом это вылилось в пневмонию.
	В виду неформальности ситуации счёт не записывали. Всем 15-10."
games = [
	[1, 'Спаич'			, 'Казаков'		, 'Прас'	, 'Олег'		, 15, 10 	],
	[2, 'Прас'			, 'Олег'		, 'Спаич'	, 'Казаков'		, 15, 10 	],
	[3, 'Прас'			, 'Олег'		, 'Спаич'	, 'Казаков'		, 15, 10 	],
	[4, 'Прас'			, 'Олег'		, 'Спаич'	, 'Казаков'		, 15, 10 	],
	[5, 'Прас'			, 'Олег'		, 'Спаич'	, 'Казаков'		, 15, 10 	]
]
games.each { |game| create_game_in_day_by_array(d18, game) }
d18.save

# День 19
d19 = Day.create(id:19)
d19.date = '15.07.2013'.to_date
d19.comment =  
	"Основных игроков не набралось - пригласили Лёху - друга Петруччо и Свету Замотаеву.
	В виду неформальности и микстовости результатов вообще не записывали."
games = [ ]
games.each { |game| create_game_in_day_by_array(d19, game) }
d19.save

# День 20
d20 = Day.create(id:20)
d20.date = '19.07.2013'.to_date
d20.comment =  
	"День перед болт-пати 2.
	Был сильный ливень, прекратившийся, как обычно, перед нашей игрой.
	И день оказался одним из самых солнечных.
	На этом фоне забыл записать резульаты, так что, наверное, они безнаёжно потеряны."
games = [ ]
games.each { |game| create_game_in_day_by_array(d20, game) }
d20.save

# День 21
d21 = Day.create(id:21)
d21.date = '22.07.2013'.to_date
d21.comment =  
	"Неявка. Хотя устроили обсуждение этой темы с применением рваных ежей и жёваных кротов."
games = [ ]
games.each { |game| create_game_in_day_by_array(d21, game) }
d21.save

# День 22
d22 = Day.create(id:22)
d22.date = '26.07.2013'.to_date
d22.comment =  
	"Неявка. Нечипур на Байкале. Прас болеет. Все разъехались.
	Хотя мы с Саней пришли с девчонками поиграли."
games = [ ]
games.each { |game| create_game_in_day_by_array(d22, game) }
d22.save

# День 23
d23 = Day.create(id:23)
d23.date = '29.07.2013'.to_date
d23.comment =  
	"День, когда Стёпа планировал бабло и набиралось 4 человека с ним."
games = [ ]
games.each { |game| create_game_in_day_by_array(d23, game) }
d23.save

# День 24
d24 = Day.create(id:24)
d24.date = '02.08.2013'.to_date
d24.comment =  "Прас вернулся, сыграл несколько игр. Спаич с Амбалом поиграли."
games = [
	[1, 'Щукин'			, 'Тёма'		, 'Спаич'	, 'Казаков'		, 16, 14 	],
	[2, 'Щукин'			, 'Тёма'		, 'Спаич'	, 'Прас'		, 16, 14 	],
	[3, 'Щукин'			, 'Тёма'		, 'Амбал'	, 'Казаков'		, 15, 8 	],
	[4, 'Спаич'			, 'Прас'		, 'Тёма'	, 'Щукин'		, 15, 11 	],
	[5, 'Спаич'			, 'Прас'		, 'Амбал'	, 'Казаков'		, 16, 14 	],
	[6, 'Спаич'			, 'Амбал'		, 'Щукин'	, 'Тёма'		, 15, 12 	],
	[7, 'Спаич'			, 'Амбал'		, 'Казаков'	, 'Щукин'		, 15, 6 	],
	[8, 'Спаич'			, 'Амбал'		, 'Щукин'	, 'Тёма'		, 15, 13 	],
	[9, 'Щукин'			, 'Тёма'		, 'Спаич'	, 'Амбал'		, 15, 13 	],
	[10,'Щукин'			, 'Тёма'		, 'Спаич'	, 'Амбал'		, 15, 12 	]
]
games.each { |game| create_game_in_day_by_array(d24, game) }
d24.save

# День 25
d25 = Day.create(id:25)
d25.date = '05.08.2013'.to_date
d25.comment =  "Неявка. Не собрались, Как сказал Прас, совсем распустились."
games = [ ]
d25.save

# День 26
d26 = Day.create(id:26)
d26.date = '09.08.2013'.to_date
d26.comment =  "8 человек с Королёвым и Щукиным."
games = [
	[1, 'Олег'			, 'Прас'		, 'Спаич'	, 'Королёв'		, 15, 12 	],
	[2, 'Щукин'			, 'Казаков'		, 'Олег'	, 'Прас'		, 15, 12 	],
	[3, 'Щукин'			, 'Казаков'		, 'Тёма'	, 'Саня'		, 15, 11 	],
	[4, 'Щукин'			, 'Казаков'		, 'Спаич'	, 'Королёв'		, 15, 11 	],
	[5, 'Саня'			, 'Тёма'		, 'Прас'	, 'Олег'		, 15, 10 	],
	[6, 'Саня'			, 'Тёма'		, 'Спаич'	, 'Королёв'		, 15, 5 	],
	[7, 'Саня'			, 'Тёма'		, 'Казаков'	, 'Щукин'		, 15, 4 	],
	[8, 'Прас'			, 'Олег'		, 'Спаич'	, 'Королёв'		, 16, 14 	],
	[9, 'Спаич'			, 'Щукин'		, 'Тёма'	, 'Саня'		, 15, 10 	]
]
games.each { |game| create_game_in_day_by_array(d26, game) }
d26.save

# День 27
d27 = Day.create(id:27)
d27.date = '12.08.2013'.to_date
d27.comment =  
	"Я не играл - порезал палец. Реконструкция от Тёмы.
	Праслов - Саня: 6-1
	Пётр - Щукин: 1-4
	Нечипур - Тимофей: 2-4
	Балу - Саня: 1-1.
	Всем 15-10."
games = [
	[1, 'Балу'			, 'Саня'		, 'Щукин'	, 'Казаков'		, 15, 10 	],
	[2, 'Нечипур'		, 'Тёма'		, 'Прас'	, 'Саня'		, 15, 10 	],
	[3, 'Нечипур'		, 'Тёма'		, 'Щукин'	, 'Казаков'		, 15, 10 	],
	[4, 'Саня'			, 'Прас'		, 'Нечипур'	, 'Тёма'		, 15, 10 	],
	[5, 'Саня'			, 'Прас'		, 'Нечипур'	, 'Тёма'		, 15, 10 	],
	[6, 'Саня'			, 'Прас'		, 'Нечипур'	, 'Тёма'		, 15, 10 	],
	[7, 'Саня'			, 'Прас'		, 'Нечипур'	, 'Тёма'		, 15, 10 	],
	[8, 'Саня'			, 'Прас'		, 'Щукин'	, 'Казаков'		, 15, 10 	],
	[9, 'Саня'			, 'Прас'		, 'Щукин'	, 'Казаков'		, 15, 10 	],
	[10,'Казаков'		, 'Щукин'		, 'Балу'	, 'Саня'		, 15, 10 	]
]
games.each { |game| create_game_in_day_by_array(d27, game) }
d27.save

# День 28
d28 = Day.create(id:28)
d28.date = '16.08.2013'.to_date
d28.comment =  
	"Сцена: Тёма принимает мяч в сторону от площадки и сам бежит за ним, крича Я! Я! Я!
	Королёв тоже бежит за этим мячом и в принципе успевает.
	Но смотрит на голосящего Тёму, сбивается с шага, останавливается и говорит:
	Тёма, что ты орёшь?!"
games = [
	[1, 'Спаич'			, 'Прас'		, 'Тёма'	, 'Королёв'		, 15, 13 	],
	[2, 'Саня'			, 'Олег'		, 'Спаич'	, 'Прас'		, 16, 14 	],
	[3, 'Саня'			, 'Олег'		, 'Тёма'	, 'Королёв'		, 15, 9 	],
	[4, 'Саня'			, 'Олег'		, 'Спаич'	, 'Прас'		, 15, 7 	],
	[5, 'Тёма'			, 'Королёв'		, 'Саня'	, 'Олег'		, 15, 11 	],
	[6, 'Тёма'			, 'Королёв'		, 'Спаич'	, 'Прас'		, 15, 13 	],
	[7, 'Тёма'			, 'Королёв'		, 'Саня'	, 'Олег'		, 16, 14 	],
	[8, 'Спаич'			, 'Прас'		, 'Тёма'	, 'Королёв'		, 15, 11 	],
	[9, 'Саня'			, 'Олег'		, 'Спаич'	, 'Прас'		, 15, 12 	],
	[10,'Саня'			, 'Олег'		, 'Спаич'	, 'Прас'		, 16, 14 	]
]
games.each { |game| create_game_in_day_by_array(d28, game) }
d28.save

# День 29
d29 = Day.create(id:29)
d29.date = '19.08.2013'.to_date
d29.comment = "Реконструкция от Тёмы"
games = [
	[1, 'Саня'			, 'Нечипур'		, 'Тёма'	, 'Прас'		, 15, 13 	],
	[2, 'Саня'			, 'Нечипур'		, 'Прас'	, 'Казаков'		, 18, 16 	],
	[3, 'Саня'			, 'Нечипур'		, 'Тёма'	, 'Казаков'		, 15, 10 	],
	[4, 'Саня'			, 'Нечипур'		, 'Тёма'	, 'Прас'		, 15, 10 	],
	[5, 'Прас'			, 'Казаков'		, 'Саня'	, 'Нечипур'		, 16, 14 	],
	[6, 'Прас'			, 'Казаков'		, 'Тёма'	, 'Нечипур'		, 15, 10 	],
	[7, 'Саня'			, 'Тёма'		, 'Прас'	, 'Казаков'		, 17, 15 	]
]
games.each { |game| create_game_in_day_by_array(d29, game) }
d29.save

# День 30
d30 = Day.create(id:30)
d30.date = '23.08.2013'.to_date
d30.comment = 
	"После первых партий пошёл дождь, но всё равно хорошо поиграли."
games = [
	[1, 'Спаич'			, 'Нечипур'		, 'Тёма'	, 'Казаков'		, 15, 12 	],
	[2, 'Прас'			, 'Олег'		, 'Спаич'	, 'Нечипур'		, 15, 11 	],
	[3, 'Прас'			, 'Олег'		, 'Саня'	, 'Казаков'		, 15, 12 	],
	[4, 'Прас'			, 'Олег'		, 'Тёма'	, 'Нечипур'		, 15, 12 	],
	[5, 'Спаич'			, 'Саня'		, 'Прас'	, 'Олег'		, 15, 10 	],
	[6, 'Спаич'			, 'Саня'		, 'Тёма'	, 'Казаков'		, 15, 10 	],
	[7, 'Спаич'			, 'Саня'		, 'Тёма'	, 'Казаков'		, 15, 6 	],
	[8, 'Спаич'			, 'Саня'		, 'Тёма'	, 'Казаков'		, 15, 4 	],
	[9, 'Спаич'			, 'Казаков'		, 'Саня'	, 'Тёма'		, 15, 10 	],
	[10,'Саня'			, 'Тёма'		, 'Спаич'	, 'Казаков'		, 15, 13 	],
	[11,'Спаич'			, 'Казаков'		, 'Саня'	, 'Тёма'		, 15, 11 	]
]
games.each { |game| create_game_in_day_by_array(d30, game) }
d30.save