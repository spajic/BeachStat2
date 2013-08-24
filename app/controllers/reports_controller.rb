class ReportsController < ApplicationController
	def legioners
		@legioners = Player.legioners
	end
end
