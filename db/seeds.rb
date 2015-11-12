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
	['Королёв'	, true	],
	['Алёхин'	, true	],
	['Амбал'	, true	],
	['Ерош'		, true	],
	['Митя'		, true	],
	['Ден'		, true	],
	['Егор'		, true	],
	['Кривов'	, true	],
	['Якут'		, true	]
]
Players.each do |p| 
	player = Player.new(name: p[0])
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
	22 мая (пт) отменили из-за погоды (хотя кто-то вроде всё-таки поиграл).
	Хорошо поиграли, устали. Немного посидели в Ля Буле."
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

# День 4 (id = 4)
d4 = Day.create(id:4)
d4.date = '03.06.2015'.to_date
d4.comment = 
	"День 4. И опять среда. 
	29 мая (пт) отменили из-за сумасшедшего ливня, когда потемнело как ночью."
games = [
	[1, 'Саня'		, 'Казаков'		, 'Прас'	, 'Тёма'		, 15, 12],
	[2, 'Саня'		, 'Казаков'		, 'Спаич'	, 'Игорь'		, 15, 10],
	[3, 'Саня'		, 'Казаков'		, 'Браток'	, 'Тёма'		, 15, 9],
	[4, 'Спаич'		, 'Игорь'		, 'Браток'	, 'Прас'		, 15, 12],
	[5, 'Саня'		, 'Казаков'		, 'Спаич'	, 'Игорь'		, 15, 12],
	[6, 'Саня'		, 'Казаков'		, 'Прас'	, 'Тёма'		, 15, 11],
	[7, 'Саня'		, 'Казаков'		, 'Браток'	, 'Игорь'		, 15, 9],
	[8, 'Прас'		, 'Тёма'		, 'Спаич'	, 'Игорь'		, 15, 9],
	[9, 'Прас'		, 'Тёма'		, 'Саня'	, 'Казаков'		, 15, 9],
	[10,'Прас'		, 'Тёма'		, 'Спаич'	, 'Браток'		, 15, 7]
]
games.each { |game| create_game_in_day_by_array(d4, game) }
d4.save

# (-) 05 июня (пт) - я на 5nizza, никто не записывал
# (-) 10 июня (ср) - не набрали народу, вчетвером дорого
# (-) 12 июня (пт) - праздник, в Крыму
# (-) 17 июня (ср) - Я не ходил (отмечали Наш с Машей день в Бизоне)
# (-) 19 июня (пт) - Я на MUSE, в ПГ выпускной

# День 5 (id = 5)
d5 = Day.create(id:5)
d5.date = '24.06.2015'.to_date
d5.comment = 
	"День 5. И опять среда. Я вышел на площадку с ощущением, что не помню, 
	когда последний раз играл.
	05 июня (пт) - я ходил на 5nizza, никто не записывал.
	10 июня (ср) - не набрали народу (вчетвером дорого).
	12 июня (пт) - День России, праздник.
	17 июня (ср) - я не ходил, никто не записывал.
	19 июня (пт) - в ПГ выпускной, а ещё и концерт muse."
games = [
	[1, 'Саня'		, 'Игорь'		, 'Спаич'	, 'Прас'		, 15, 10],
	[2, 'Стёпа'		, 'Браток'		, 'Саня'	, 'Игорь'		, 15, 10],
	[3, 'Спаич'		, 'Прас'		, 'Стёпа'	, 'Браток'		, 16, 14],
	[4, 'Спаич'		, 'Прас'		, 'Саня'	, 'Игорь'		, 15, 12],
	[5, 'Спаич'		, 'Прас'		, 'Стёпа'	, 'Браток'		, 15, 10],
	[6, 'Спаич'		, 'Прас'		, 'Саня'	, 'Игорь'		, 15, 13],
	[7, 'Спаич'		, 'Прас'		, 'Стёпа'	, 'Браток'		, 15, 7],
	[8, 'Саня'		, 'Игорь'		, 'Спаич'	, 'Прас'		, 15, 12],
	[9, 'Саня'		, 'Игорь'		, 'Стёпа'	, 'Браток'		, 15, 10],
	[10,'Саня'		, 'Игорь'		, 'Спаич'	, 'Браток'		, 16, 14]
]
games.each { |game| create_game_in_day_by_array(d5, game) }
d5.save

# День 6 (id = 6)
d6 = Day.create(id:6)
d6.date = '26.06.2015'.to_date
d6.comment = 
	"День 6. ПЯТНИЦА!"
games = [
	[1, 'Прас'		, 'Игорь'		, 'Спаич'	, 'Тёма'		, 15, 13],
	[2, 'Олег'		, 'Алёхин'		, 'Прас'	, 'Игорь'		, 15, 12],
	[3, 'Спаич'		, 'Тёма'		, 'Олег'	, 'Алёхин'		, 15, 12],
	[4, 'Спаич'		, 'Тёма'		, 'Прас'	, 'Игорь'		, 15, 12],
	[5, 'Спаич'		, 'Тёма'		, 'Олег'	, 'Алёхин'		, 15, 8],
	[6, 'Спаич'		, 'Тёма'		, 'Прас'	, 'Игорь'		, 15, 9],
	[7, 'Олег'		, 'Алёхин'		, 'Спаич'	, 'Тёма'		, 16, 14],
	[8, 'Олег'		, 'Алёхин'		, 'Прас'	, 'Игорь'		, 15, 11],
	[9, 'Олег'		, 'Алёхин'		, 'Спаич'	, 'Тёма'		, 16, 14],
	[10,'Олег'		, 'Алёхин'		, 'Прас'	, 'Игорь'		, 15, 12]
]
games.each { |game| create_game_in_day_by_array(d6, game) }
d6.save

# День 7 (id = 7)
d7 = Day.create(id:7)
d7.date = '01.07.2015'.to_date
d7.comment = 
	"День 7. Среда, первый день Июля. Амбал приехал из Тулы. 
	Не признавал себя членом большой восьёмрки, отказывался платить.
	Закрыл номер пряником, чтобы не платить за парковку."
games = [
	[1, 'Амбал'		, 'Казаков'		, 'Спаич'	, 'Прас'		, 15, 10],
	[2, 'Амбал'		, 'Казаков'		, 'Игорь'	, 'Тёма'		, 15, 6],
	[3, 'Амбал'		, 'Казаков'		, 'Саня'	, 'Браток'		, 15, 12],
	[4, 'Спаич'		, 'Прас'		, 'Тёма'	, 'Игорь'		, 15, 9],
	[5, 'Спаич'		, 'Прас'		, 'Амбал'	, 'Казаков'		, 15, 7],
	[6, 'Спаич'		, 'Прас'		, 'Саня'	, 'Браток'		, 15, 12],
	[7, 'Амбал'		, 'Казаков'		, 'Тёма'	, 'Игорь'		, 15, 10],
	[8, 'Спаич'		, 'Прас'		, 'Амбал'	, 'Казаков'		, 15, 12],
	[9, 'Саня'		, 'Браток'		, 'Амбал'	, 'Игорь'		, 15, 10],
	[10,'Саня'		, 'Браток'		, 'Спаич'	, 'Игорь'		, 15, 10]
]
games.each { |game| create_game_in_day_by_array(d7, game) }
d7.save

# День 8 (id = 8)
d8 = Day.create(id:8)
d8.date = '03.07.2015'.to_date
d8.comment = 
	"День 8. Второе явление Амбала."
games = [
	[1, 'Спаич'		, 'Браток'		, 'Амбал'	, 'Казаков'		, 15, 8],
	[2, 'Спаич'		, 'Браток'		, 'Стёпа'	, 'Прас'		, 15, 12],
	[3, 'Спаич'		, 'Браток'		, 'Олег'	, 'Игорь'		, 15, 10],
	[4, 'Амбал'		, 'Казаков'		, 'Стёпа'	, 'Прас'		, 16, 14],
	[5, 'Амбал'		, 'Казаков'		, 'Спаич'	, 'Браток'		, 15, 12],
	[6, 'Амбал'		, 'Казаков'		, 'Прас'	, 'Стёпа'		, 15, 12],
	[7, 'Амбал'		, 'Казаков'		, 'Олег'	, 'Игорь'		, 15, 13],
	[8, 'Стёпа'		, 'Прас'		, 'Спаич'	, 'Браток'		, 15, 12],
	[9, 'Стёпа'		, 'Прас'		, 'Амбал'	, 'Казаков'		, 15, 11],
	[10,'Стёпа'		, 'Прас'		, 'Олег'	, 'Игорь'		, 15, 12],
	[11,'Спаич'		, 'Браток'		, 'Амбал'	, 'Казаков'		, 15, 13],
	[12,'Спаич'		, 'Браток'		, 'Прас'	, 'Стёпа'		, 15, 6]
]
games.each { |game| create_game_in_day_by_array(d8, game) }
d8.save

# День 9 (id = 9)
d9 = Day.create(id:9)
d9.date = '08.07.2015'.to_date
d9.comment = 
	"День 9. И игр 9. Рекордно мало, рубились."
games = [
	[1, 'Казаков'	, 'Тёма'		, 'Спаич'	, 'Браток'		, 15, 11],
	[2, 'Прас'		, 'Игорь'		, 'Казаков'	, 'Тёма'		, 15, 10],
	[3, 'Прас'		, 'Игорь'		, 'Спаич'	, 'Браток'		, 16, 14],
	[4, 'Прас'		, 'Игорь'		, 'Казаков'	, 'Тёма'		, 15, 12],
	[5, 'Прас'		, 'Игорь'		, 'Спаич'	, 'Браток'		, 15, 12],
	[6, 'Казаков'	, 'Тёма'		, 'Прас'	, 'Игорь'		, 16, 14],
	[7, 'Казаков'	, 'Тёма'		, 'Спаич'	, 'Браток'		, 15, 8],
	[8, 'Казаков'	, 'Тёма'		, 'Прас'	, 'Игорь'		, 15, 9],
	[9, 'Казаков'	, 'Тёма'		, 'Спаич'	, 'Браток'		, 15, 13]
]
games.each { |game| create_game_in_day_by_array(d9, game) }
d9.save

# День 10 (id = 10)
d10 = Day.create(id:10)
d10.date = '10.07.2015'.to_date
d10.comment = 
	"День 10. Ерош пришёл шестым. 
	Было холодно, темно и очень сложно согреться и заставить себя играть."
games = [
	[1, 'Тёма'		, 'Алёхин'		, 'Спаич'	, 'Прас'		, 16, 14],
	[2, 'Тёма'		, 'Алёхин'		, 'Браток'	, 'Ерош'		, 15, 12],
	[3, 'Тёма'		, 'Алёхин'		, 'Спаич'	, 'Прас'		, 15, 12],
	[4, 'Тёма'		, 'Алёхин'		, 'Браток'	, 'Ерош'		, 15, 12],
	[5, 'Спаич'		, 'Прас'		, 'Тёма'	, 'Браток'		, 16, 14],
	[6, 'Спаич'		, 'Прас'		, 'Ерош'	, 'Алёхин'		, 15, 9],
	[7, 'Спаич'		, 'Прас'		, 'Тёма'	, 'Браток'		, 15, 6],
	[8, 'Ерош'		, 'Алёхин'		, 'Спаич'	, 'Прас'		, 15, 9],
	[9, 'Ерош'		, 'Алёхин'		, 'Спаич'	, 'Прас'		, 15, 5],
	[10,'Спаич'		, 'Прас'		, 'Ерош'	, 'Алёхин'		, 15, 11]
]
games.each { |game| create_game_in_day_by_array(d10, game) }
d10.save

# День 11 (id = 11)
d11 = Day.create(id:11)
d11.date = '15.07.2015'.to_date
d11.comment = 
	"День 11. Хорошо рубились, Браток рвал и метал. Стёпа подвернул колено, 
	одну игру не доиграли."
games = [
	[1, 'Спаич'		, 'Стёпа'		, 'Тёма'	, 'Алёхин'		, 15, 9],
	[2, 'Саня'		, 'Браток'		, 'Спаич'	, 'Стёпа'		, 15, 12],
	[3, 'Саня'		, 'Браток'		, 'Тёма'	, 'Алёхин'		, 15, 6],
	[4, 'Саня'		, 'Браток'		, 'Спаич'	, 'Стёпа'		, 15, 10],
	[5, 'Тёма'		, 'Алёхин'		, 'Саня'	, 'Браток'		, 16, 14],
	[6, 'Спаич'		, 'Стёпа'		, 'Тёма'	, 'Алёхин'		, 15, 13],
	[7, 'Саня'		, 'Браток'		, 'Тёма'	, 'Алёхин'		, 15, 12],
	[8, 'Саня'		, 'Браток'		, 'Спаич'	, 'Тёма'		, 15, 9],
	[9, 'Спаич'		, 'Алёхин'		, 'Саня'	, 'Браток'		, 15, 12]
]
games.each { |game| create_game_in_day_by_array(d11, game) }
d11.save

# День 12 (id = 12)
d12 = Day.create(id:12)
d12.date = '17.07.2015'.to_date
d12.comment = 
	"День 12. Никита пригласил легионеров Митю, Дена и Егора.
	Результаты дословно: 10 партий темик+никита выйграли у 
	митя+денис и бригадир+егор, одну партию митя+денис у бригида+егор"
games = [
	[1, 'Тёма'		, 'Алёхин'		, 'Митя'	, 'Ден'			, 16, 14],
	[2, 'Тёма'		, 'Алёхин'		, 'Браток'	, 'Егор'		, 15, 13],
	[3, 'Тёма'		, 'Алёхин'		, 'Митя'	, 'Ден'			, 15, 12],
	[4, 'Тёма'		, 'Алёхин'		, 'Браток'	, 'Егор'		, 15, 11],
	[5, 'Тёма'		, 'Алёхин'		, 'Митя'	, 'Ден'			, 15, 10],
	[6, 'Тёма'		, 'Алёхин'		, 'Браток'	, 'Егор'		, 15, 9],
	[7, 'Тёма'		, 'Алёхин'		, 'Митя'	, 'Ден'			, 15, 8],
	[8, 'Тёма'		, 'Алёхин'		, 'Браток'	, 'Егор'		, 15, 9],
	[9, 'Тёма'		, 'Алёхин'		, 'Митя'	, 'Ден'			, 15, 10],
	[10,'Тёма'		, 'Алёхин'		, 'Браток'	, 'Егор'		, 15, 11],
	[11,'Митя'		, 'Ден'			, 'Браток'	, 'Егор'		, 15, 12]
	
]
games.each { |game| create_game_in_day_by_array(d12, game) }
d12.save

# День 13 (id = 13)
d13 = Day.create(id:13)
d13.date = '24.07.2015'.to_date
d13.comment = 
"День 13. Пятница. В среду, 21 июля в ПГ было мероприятие.
Если кратко, то Митя и Олег всех надрали, а так 
результаты записал Никита. Счёт наугад."
games = [
[1, 'Митя'		, 'Алёхин'		, 'Прас'	, 'Тёма'		, 16, 14],
[2, 'Прас'		, 'Тёма'		, 'Митя'	, 'Алёхин'		, 15, 13],
[3, 'Прас'		, 'Тёма'		, 'Митя'	, 'Алёхин'		, 15, 12],
[4, 'Митя'		, 'Олег'		, 'Прас'	, 'Тёма'		, 15, 11],
[5, 'Митя'		, 'Олег'		, 'Тёма'	, 'Алёхин'		, 15, 10],
[6, 'Митя'		, 'Олег'		, 'Алёхин'	, 'Прас'		, 15, 9],
[7, 'Митя'		, 'Олег'		, 'Прас'	, 'Тёма'		, 15, 8],
[5, 'Казаков'	, 'Тёма'		, 'Спаич'	, 'Прас'		, 15, 10],
[8, 'Митя'		, 'Олег'		, 'Тёма'	, 'Алёхин'		, 15, 9],
[9, 'Олег'		, 'Прас'		, 'Тёма'	, 'Алёхин'		, 15, 10]
]
games.each { |game| create_game_in_day_by_array(d13, game) }
d13.save

# День 14 (id = 14)
d14 = Day.create(id:14)
d14.date = '29.07.2015'.to_date
d14.comment = 
"День 14. Среда. Неплохо поиграли. Пришли Маша и Саша."
games = [
[1, 'Казаков'	, 'Тёма'		, 'Спаич'	, 'Прас'		, 15, 7],
[2, 'Казаков'	, 'Тёма'		, 'Стёпа'	, 'Игорь'		, 15, 10],
[3, 'Спаич'		, 'Прас'		, 'Казаков'	, 'Тёма'		, 16, 14],
[4, 'Спаич'		, 'Прас'		, 'Стёпа'	, 'Игорь'		, 15, 11],
[5, 'Казаков'	, 'Тёма'		, 'Спаич'	, 'Прас'		, 15, 13],
[6, 'Казаков'	, 'Тёма'		, 'Стёпа'	, 'Игорь'		, 15, 12],
[7, 'Казаков'	, 'Тёма'		, 'Спаич'	, 'Прас'		, 16, 14],
[8, 'Казаков'	, 'Тёма'		, 'Стёпа'	, 'Игорь'		, 15, 13],
[9, 'Казаков'	, 'Тёма'		, 'Спаич'	, 'Прас'		, 16, 14],
[10,'Спаич'		, 'Прас'		, 'Стёпа'	, 'Игорь'		, 15, 11]
]
games.each { |game| create_game_in_day_by_array(d14, game) }
d14.save

# День 15 (id = 15)
d15 = Day.create(id:15)
d15.date = '31.07.2015'.to_date
d15.comment = 
"День 15. Пятница. Спаич с Прасом на славу помучались второй день подряд."
games = [
[1, 'Амбал'		, 'Казаков'		, 'Спаич'	, 'Прас'		, 15, 10],
[2, 'Амбал'		, 'Казаков'		, 'Олег'	, 'Игорь'		, 15, 13],
[3, 'Спаич'		, 'Прас'		, 'Амбал'	, 'Казаков'		, 16, 14],
[4, 'Спаич'		, 'Прас'		, 'Олег'	, 'Игорь'		, 16, 14],
[5, 'Амбал'		, 'Казаков'		, 'Спаич'	, 'Прас'		, 15, 8],
[6, 'Амбал'		, 'Казаков'		, 'Олег'	, 'Игорь'		, 16, 14],
[7, 'Амбал'		, 'Казаков'		, 'Спаич'	, 'Прас'		, 15, 10],
[8, 'Амбал'		, 'Казаков'		, 'Олег'	, 'Игорь'		, 15, 13],
[9, 'Амбал'		, 'Казаков'		, 'Олег'	, 'Игорь'		, 15, 12],
[10,'Олег'		, 'Игорь'		, 'Спаич'	, 'Прас'		, 15, 11]
]
games.each { |game| create_game_in_day_by_array(d15, game) }
d15.save

# День 16 (id = 16)
d16 = Day.create(id:16)
d16.date = '05.08.2015'.to_date
d16.comment = 
"День 16. Первый игровой день августа. Пришли Лёха Кривов, Лёха Фёдоров,
и с Лёхой Васильевым количество Лёх на площадке достигло 50%."
games = [
[1, 'Кривов'	, 'Якут'		, 'Спаич'	, 'Казаков'		, 15, 12],
[2, 'Браток'	, 'Олег'		, 'Кривов'	, 'Якут'		, 15, 13],
[3, 'Спаич'		, 'Казаков'		, 'Браток'	, 'Олег'		, 15, 10],
[4, 'Кривов'	, 'Якут'		, 'Спаич'	, 'Казаков'		, 15, 13],
[5, 'Кривов'	, 'Якут'		, 'Браток'	, 'Олег'		, 15, 11],
[6, 'Спаич'		, 'Казаков'		, 'Кривов'	, 'Якут'		, 15, 12],
[7, 'Спаич'		, 'Казаков'		, 'Браток'	, 'Олег'		, 15, 13],
[8, 'Спаич'		, 'Казаков'		, 'Кривов'	, 'Якут'		, 15, 13],
[9, 'Спаич'		, 'Казаков'		, 'Браток'	, 'Олег'		, 15, 12],
[10,'Спаич'		, 'Казаков'		, 'Кривов'	, 'Якут'		, 15, 13]
]
games.each { |game| create_game_in_day_by_array(d16, game) }
d16.save

# День 17 (id = 17)
d17 = Day.create(id:17)
d17.date = '07.08.2015'.to_date
d17.comment = 
"День 17. Спаич с Амбалом повыигрывали в своё удовольствие."
games = [
[1, 'Спаич'		, 'Амбал'		, 'Прас'	, 'Игорь'		, 15, 10],
[2, 'Спаич'		, 'Амбал'		, 'Стёпа'	, 'Браток'		, 15, 9],
[3, 'Спаич'		, 'Амбал'		, 'Прас'	, 'Игорь'		, 15, 4],
[4, 'Олег'		, 'Браток'		, 'Спаич'	, 'Амбал'		, 15, 13],
[5, 'Олег'		, 'Браток'		, 'Стёпа'	, 'Прас'		, 15, 10],
[6, 'Олег'		, 'Браток'		, 'Спаич'	, 'Игорь'		, 15, 9],
[7, 'Спаич'		, 'Амбал'		, 'Олег'	, 'Браток'		, 15, 12],
[8, 'Спаич'		, 'Амбал'		, 'Стёпа'	, 'Игорь'		, 15, 8],
[9, 'Спаич'		, 'Амбал'		, 'Олег'	, 'Браток'		, 15, 10],
[10,'Спаич'		, 'Амбал'		, 'Стёпа'	, 'Игорь'		, 15, 10],
[11,'Спаич'		, 'Амбал'		, 'Олег'	, 'Браток'		, 15, 12]
]
games.each { |game| create_game_in_day_by_array(d17, game) }
d17.save


# День 18 (id = 18)
d18 = Day.create(id:18)
d18.date = '12.08.2015'.to_date
d18.comment = 
"День 18. Саня вернулся с метал-фестиваля. Порубились на славу впятером. 
Размялись техничкой, поэтому только 9 игр."
games = [
[1, 'Спаич'		, 'Казаков'		, 'Кривов'	, 'Браток'		, 15, 12],
[2, 'Саня'		, 'Браток'		, 'Спаич'	, 'Казаков'		, 15, 13],
[3, 'Спаич'		, 'Кривов'		, 'Саня'	, 'Браток'		, 15, 13],
[4, 'Спаич'		, 'Кривов'		, 'Саня'	, 'Казаков'		, 15, 12],
[5, 'Спаич'		, 'Кривов'		, 'Браток'	, 'Казаков'		, 15, 10],
[6, 'Саня'		, 'Браток'		, 'Спаич'	, 'Кривов'		, 15, 12],
[7, 'Кривов'	, 'Казаков'		, 'Саня'	, 'Браток'		, 15, 12],
[8, 'Кривов'	, 'Казаков'		, 'Саня'	, 'Спаич'		, 15, 9],
[9, 'Кривов'	, 'Казаков'		, 'Спаич'	, 'Браток'		, 15, 11]
]
games.each { |game| create_game_in_day_by_array(d18, game) }
d18.save


# День 19 (id = 19)
d19 = Day.create(id:19)
d19.date = '14.08.2015'.to_date
d19.comment = 
"День 19. ДР Амбала, и он играет с нами. Потом Лебединое озеро."
games = [
[1, 'Спаич'		, 'Амбал'		, 'Кривов'	, 'Браток'		, 15, 7],
[2, 'Спаич'		, 'Амбал'		, 'Браток'	, 'Игорь'		, 15, 12],
[3, 'Спаич'		, 'Амбал'		, 'Кривов'	, 'Игорь'		, 16, 14],
[4, 'Кривов'	, 'Браток'		, 'Спаич'	, 'Амбал'		, 15, 12],
[5, 'Спаич'		, 'Игорь'		, 'Кривов'	, 'Браток'		, 16, 14],
[6, 'Амбал'		, 'Браток'		, 'Спаич'	, 'Игорь'		, 15, 9],
[7, 'Кривов'	, 'Игорь'		, 'Браток'	, 'Амбал'		, 15, 12],
[8, 'Спаич'		, 'Амбал'		, 'Кривов'	, 'Игорь'		, 15, 13],
[9, 'Спаич'		, 'Амбал'		, 'Кривов'	, 'Браток'		, 15, 12],
[10,'Игорь'		, 'Браток'		, 'Спаич'	, 'Амбал'		, 15, 12],
[11,'Спаич'		, 'Кривов'		, 'Браток'	, 'Игорь'		, 15, 5]
]
games.each { |game| create_game_in_day_by_array(d19, game) }
d19.save

# День 20 (id = 20)
d20 = Day.create(id:20)
d20.date = '19.08.2015'.to_date
d20.comment = 
"День 20. ДР Братка, и он играет с нами.
Прохладно, но лично мне в кофте и штанах было норм.
Хорошо порубились."
games = [
[1, 'Кривов'	, 'Казаков'		, 'Спаич'	, 'Саня'		, 15, 10],
[2, 'Кривов'	, 'Казаков'		, 'Браток'	, 'Игорь'		, 15, 7],
[3, 'Спаич'		, 'Саня'		, 'Кривов'	, 'Казаков'		, 15, 12],
[4, 'Спаич'		, 'Саня'		, 'Браток'	, 'Игорь'		, 15, 8],
[5, 'Спаич'		, 'Саня'		, 'Кривов'	, 'Казаков'		, 16, 14],
[6, 'Спаич'		, 'Саня'		, 'Браток'	, 'Игорь'		, 15, 13],
[7, 'Спаич'		, 'Саня'		, 'Кривов'	, 'Казаков'		, 15, 13],
[8, 'Спаич'		, 'Саня'		, 'Браток'	, 'Игорь'		, 15, 13],
[9, 'Кривов'	, 'Казаков'		, 'Спаич'	, 'Саня'		, 15, 9],
[10,'Кривов'	, 'Казаков'		, 'Саня'	, 'Игорь'		, 15, 10]
]
games.each { |game| create_game_in_day_by_array(d20, game) }
d20.save

# День 21 (id = 21)
d21 = Day.create(id:21)
d21.date = '21.08.2015'.to_date
d21.comment = 
"День 21. Хорошая погода. А уровень волейбола получился так себе."
games = [
[1, 'Спаич'		, 'Олег'		, 'Королёв'	, 'Амбал'		, 15, 5],
[2, 'Спаич'		, 'Олег'		, 'Королёв'	, 'Браток'		, 15, 12],
[3, 'Спаич'		, 'Олег'		, 'Амбал'	, 'Игорь'		, 15, 10],
[4, 'Спаич'		, 'Олег'		, 'Королёв'	, 'Браток'		, 15, 11],
[5, 'Амбал'		, 'Игорь'		, 'Королёв'	, 'Браток'		, 15, 7],
[6, 'Спаич'		, 'Олег'		, 'Амбал'	, 'Игорь'		, 15, 8],
[7, 'Спаич'		, 'Олег'		, 'Королёв'	, 'Браток'		, 15, 11],
[8, 'Амбал'		, 'Игорь'		, 'Спаич'	, 'Олег'		, 15, 12],
[9, 'Амбал'		, 'Игорь'		, 'Королёв'	, 'Браток'		, 15, 7],
[10,'Спаич'		, 'Олег'		, 'Амбал'	, 'Игорь'		, 15, 12]
]
games.each { |game| create_game_in_day_by_array(d21, game) }
d21.save

# День 22 (id = 22)
d22 = Day.create(id:22)
d22.date = '26.08.2015'.to_date
d22.comment = 
"День 22. Тёплый вечер. Играть начали уже сразу в темноте. 
Из длительных поездок вернулись Тёма и Стёпа.
Хорошо обсудили впечатления в Ля Буле."
games = [
[1, 'Спаич'		, 'Браток'		, 'Казаков'	, 'Тёма'		, 16, 14],
[2, 'Спаич'		, 'Браток'		, 'Стёпа'	, 'Олег'		, 15, 11],
[3, 'Казаков'	, 'Тёма'		, 'Спаич'	, 'Браток'		, 15, 11],
[4, 'Стёпа'		, 'Олег'		, 'Казаков'	, 'Тёма'		, 16, 14],
[5, 'Стёпа'		, 'Олег'		, 'Спаич'	, 'Браток'		, 15, 8],
[6, 'Стёпа'		, 'Олег'		, 'Казаков'	, 'Тёма'		, 15, 13],
[7, 'Стёпа'		, 'Олег'		, 'Спаич'	, 'Браток'		, 15, 10],
[8, 'Казаков'	, 'Тёма'		, 'Стёпа'	, 'Олег'		, 15, 12],
[9, 'Казаков'	, 'Тёма'		, 'Спаич'	, 'Браток'		, 16, 14]
]
games.each { |game| create_game_in_day_by_array(d22, game) }
d22.save

# День 23 (id = 23)
d23 = Day.create(id:23)
d23.date = '28.08.2015'.to_date
d23.comment = 
"День 23. Последний летний игровой день! Темно, но тепло."
games = [
[1, 'Казаков'	, 'Кривов'		, 'Амбал'	, 'Игорь'		, 15, 12],
[2, 'Казаков'	, 'Кривов'		, 'Спаич'	, 'Тёма'		, 15, 12],
[3, 'Казаков'	, 'Кривов'		, 'Амбал'	, 'Игорь'		, 15, 12],
[4, 'Спаич'		, 'Тёма'		, 'Казаков'	, 'Кривов'		, 15, 11],
[5, 'Спаич'		, 'Тёма'		, 'Амбал'	, 'Игорь'		, 15, 8],
[6, 'Спаич'		, 'Тёма'		, 'Казаков'	, 'Кривов'		, 15, 10],
[7, 'Спаич'		, 'Тёма'		, 'Амбал'	, 'Игорь'		, 15, 11],
[8, 'Казаков'	, 'Кривов'		, 'Спаич'	, 'Тёма'		, 15, 11],
[9, 'Казаков'	, 'Кривов'		, 'Амбал'	, 'Игорь'		, 15, 10],
[10,'Казаков'	, 'Кривов'		, 'Спаич'	, 'Амбал'		, 15, 10],
[11,'Спаич' 	, 'Амбал'		, 'Казаков'	, 'Кривов'		, 15, 9]
]
games.each { |game| create_game_in_day_by_array(d23, game) }
d23.save