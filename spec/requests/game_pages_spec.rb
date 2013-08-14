require 'spec_helper'

describe "Game Pages" do
  subject { page }

  describe "index page" do
    before { visit games_path }

    it { should have_content('Результаты всех игр') }

    describe 'should show table column names' do
		it { should have_content('День') }
    	it { should have_content('№') }
    	it { should have_content('Winner 1') }
    	it { should have_content('Winner 2') }
    	it { should have_content('Loser 1') }
		it { should have_content('Loser 2') }
    	it { should have_content('W pts') }
    	it { should have_content('L pts') }
    end
  end
end
