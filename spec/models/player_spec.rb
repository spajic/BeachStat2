require 'spec_helper'

describe Player do
  fixtures :players
  fixtures :days
  fixtures :games 
  fixtures :results
  
  describe 'it should respond to methods' do
    before  { @player = Player.new }
    subject { @player }

    it { Player.should respond_to(:load_data_for_rating_calculation) }
	it { should respond_to(:wins_count				) }
	it { should respond_to(:loses_count				) }
	it { should respond_to(:games_count				) }
	it { should respond_to(:wins_to_games_ratio		) }
	it { should respond_to(:more_wins_man_count		) }
	it { should respond_to(:more_wins_man_ratio		) }
	it { should respond_to(:rating 					) }
	it { should respond_to(:more_rating_man_count 	) }
	it { should respond_to(:place 					) }
  end

  describe 'it work correctly on fixtures data' do
  	before  { 
  		Player.load_data_for_rating_calculation
  		@spajic = Player.first 
  		@pras   = Player.find(2)
  	}
  	it { @spajic.name.should eq('Спаич') }
  	it { @pras  .name.should eq('Прас' ) }

  	it { @spajic.wins_count.should eq(2) }
  	it { @spajic.loses_count.should eq(0) }
  	it { @spajic.games_count.should eq(2) }

  	it { @spajic.wins_to_games_ratio.should eq(100) }
 	it { @pras  .wins_to_games_ratio.should eq(50) }

 	it { @spajic.more_wins_man_count.should eq(0) }
	it { @pras  .more_wins_man_count.should eq(1) }

	it { @spajic.more_wins_man_ratio.should eq(100) }
	it { @pras.more_wins_man_ratio.should   eq(75) }

	it { @spajic.rating.should eq(100) }
	it { @pras.rating.should eq(62) }

	it { @spajic.more_rating_man_count.should eq(0) }
	it { @pras  .more_rating_man_count.should eq(1) }

	it { @spajic.place.should eq(1) }
	it { @pras  .place.should eq(2) }
  end
end
