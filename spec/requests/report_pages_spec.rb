
describe "Report Pages" do
  subject { page }

  describe "legioners page" do
  	fixtures :days
  	fixtures :players
  	fixtures :games
  	fixtures :results
 
    before { 
    	visit '/reports/legioners'
    	# Debug: save_and_open_page
    }

    it { should have_content('Отчёт по легионерам') }
 
    describe 'should show table column names' do 
		it { should have_content('Ф.И.О.'       ) }
      	it { should have_content('Дни'          ) } 
    	it { should have_content('Взнос'        ) }
    end 

    describe 'shold show data' do
    	it { should have_content('Прас') }
    	it { should_not have_content('Спаич') }
    end

    describe 'should show JackPot' do 
    	it { should have_content('JackPot')} 
    end

  end
end