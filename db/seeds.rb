# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Players = ['Спаич', 'Прас', 'Баранов', 'Олег', 'Стёпа', 'Федоринин']
Players.each {|p| Player.find_or_create_by_name(p)}

# День 1 (id = 1)
d1 = Day.find_or_create_by_id(id:1)
d1.date = '13.05.2013'.to_date
d1.comment = 
	"Очень тёплая погода. 
	Тепло, хорошо. Не самый плохой уровени волейбола для открытия сезона"
d1.save

