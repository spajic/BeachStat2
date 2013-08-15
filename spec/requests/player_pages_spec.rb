describe "Players Pages" do
  subject { page }

  describe "index page" do
  	fixtures :days
  	fixtures :players
  	fixtures :games
  	fixtures :results

    before { 
    	visit players_path 
    	# Debug: save_and_open_page
    }

    it { should have_content('Статистика игроков') }

    describe 'should show table column names' do
		it { should have_content('Ф.И.О.') 	}
    	
    end

    describe 'shold show data' do
    	it { should have_content('Спаич') }
    end

  end
end