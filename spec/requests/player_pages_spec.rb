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
    	it { should have_content('Win') }
      it { should have_content('Lose') }
      it { should have_content('Games') }
      it { should have_content('W/G') }
      it { should have_content('Больше побед') } 
      it { should have_content('БПР') }
      it { should have_content('Рейтинг') }
      it { should have_content('Место') }
    end

    describe 'shold show data' do
    	it { should have_content('Спаич') }
    end

  end
end