require 'spec_helper'

describe "Game Pages" do
  subject { page }

  describe "index page" do
  	fixtures :days
  	fixtures :players
  	fixtures :games
  	fixtures :results

    before { 
    	visit games_path 
    	save_and_open_page
    }

    it { should have_content('Результаты всех игр') }

    describe 'should show table column names' do
		it { 
			should have_content('День') 
			should have_content('№')
			should have_content('Winner 1')
			should have_content('Winner 2')
			should have_content('Loser 1')
			should have_content('Loser 2')
			should have_content('W pts')
			should have_content('L pts')
		}
    	
    end

    describe 'shold show data' do
    	it { should have_content('Спаич') }
    end

  end
end
