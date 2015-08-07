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

    it { should have_content('Рейтинг игроков') }

    describe 'should show table column names' do
		  it { should have_content('ФИО' ) }
      it { should have_content('D'   ) } 
    	it { should have_content('W'   ) }
      it { should have_content('L'   ) } 
      it { should have_content('G'   ) }
      it { should have_content('W/G' ) }
      it { should have_content('БП'  ) } 
      it { should have_content('БПР' ) }
      it { should have_content('Р-г' ) } 
      it { should have_content('#'   ) }
    end

    describe 'shold show data' do
    	it { should have_content('Спаич') }
    end

  end
end