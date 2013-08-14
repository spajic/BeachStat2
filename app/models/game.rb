class Game < ActiveRecord::Base
	belongs_to :day
	has_many :results
end
