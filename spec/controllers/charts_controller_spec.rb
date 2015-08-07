require 'spec_helper'

describe ChartsController do
	describe "GET 'rating'" do
		it 'should select Rating template for rendering' do
			get :rating
			response.should render_template('rating')
		end
	end
end
