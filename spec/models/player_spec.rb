require 'spec_helper'

describe Player do
  fixtures :players
  fixtures :days
  fixtures :games 
  fixtures :results
  
  describe 'it should respond to methods' do
    before  { @player = Player.new }
    subject { @player }

    it { should respond_to(:wins_count				) }
	it { should respond_to(:loses_count				) }
	it { should respond_to(:games_count				) }
	it { should respond_to(:wins_to_games_ratio		) }
	it { should respond_to(:more_wins_man_count		) }
	it { should respond_to(:more_wins_man_ratio		) }
	it { should respond_to(:rating 					) }
	it { should respond_to(:more_rating_man_count 	) }
	it { should respond_to(:place 					) }
	it { Player.should respond_to(:all_sorted_by_place		) }
	it { Player.should respond_to(:calculate_statistics		) }
  end

  describe 'it work correctly on fixtures data' do
  	before  { 
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

  describe '#calculate_statistics' do
  	before {
  		@spajic = Player.first
  		@pras   = Player.find(2)
  		@baranov= Player.find(3)
  		@stats  = Player.calculate_statistics
  	}

  	it { @stats['Спаич']['wins_count'].should eq(@spajic.wins_count) }
  	it { @stats['Спаич']['loses_count'].should eq(@spajic.loses_count) }
  	it { @stats['Спаич']['games_count'].should eq(@spajic.games_count) }

  	it { @stats['Спаич']['wins_to_games_ratio'].should eq(@spajic.wins_to_games_ratio) }
  	it { @stats['Прас']['wins_to_games_ratio'].should eq(@pras.wins_to_games_ratio) }

	it { @stats['Спаич']['more_wins_man_count'].should eq(@spajic.more_wins_man_count) }
	it { @stats['Прас']['more_wins_man_count'].should eq(@pras.more_wins_man_count) }
	it { @stats['Баранов']['more_wins_man_count'].should eq(@baranov.more_wins_man_count) }

	it { @stats['Спаич']['more_wins_man_ratio'].should eq(@spajic.more_wins_man_ratio) }
	it { @stats['Прас']['more_wins_man_ratio'].should eq(@pras.more_wins_man_ratio) }
	
	it { @stats['Спаич']['rating'].should eq(@spajic.rating) }
	it { @stats['Прас']['rating'].should eq(@pras.rating) }

	it { @stats['Спаич']['more_rating_man_count'].should eq(@spajic.more_rating_man_count) }
	it { @stats['Прас']['more_rating_man_count'].should eq(@pras.more_rating_man_count) }

	it { @stats['Спаич']['place'].should eq(@spajic.place) }
	it { @stats['Прас']['place'].should eq(@pras.place) }
  end
end
