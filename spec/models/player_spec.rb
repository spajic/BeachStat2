require 'spec_helper'

describe Player do
  fixtures :players
  fixtures :days
  fixtures :games 
  fixtures :results
  
  describe 'it should respond to methods' do
    before  { @player = Player.new }
    subject { @player }

  it { Player.should respond_to(:legioners         ) } 
  it { Player.should respond_to(:jackpot    ) }
  it { should respond_to(:is_legioner       ) } 
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

  # Сводку по данным fixtures можно посмотреть в файле
  # calculate_statisitcs_on_fixture_data.txt
  describe 'it work correctly on fixtures data' do
  	before  { 
  		@spajic = Player.first 
  		@pras   = Player.find(2)
      @spajic_s = {
        "wins_count"=>2, 
        "loses_count"=>0,
        "games_count"=>2, 
        "wins_to_games_ratio"=>100, 
        "more_wins_man_count"=>0, 
        "more_wins_man_ratio"=>100,
        "rating"=>100, 
        "more_rating_man_count"=>0, 
        "place"=>1
      }
      @pras_s = {
        "wins_count"=>1, 
        "loses_count"=>1, 
        "games_count"=>2, 
        "wins_to_games_ratio"=>50, 
        "more_wins_man_count"=>1, 
        "more_wins_man_ratio"=>67, 
        "rating"=>58, 
        "more_rating_man_count"=>1, 
        "place"=>2
      }
      @baranov_s = {
        "wins_count"=>1, 
        "loses_count"=>1, 
        "games_count"=>2, 
        "wins_to_games_ratio"=>50, 
        "more_wins_man_count"=>1, 
        "more_wins_man_ratio"=>67, 
        "rating"=>58, 
        "more_rating_man_count"=>2, 
        "place"=>3
      }
      @oleg_s = {
        "wins_count"=>0, 
        "loses_count"=>2, 
        "games_count"=>2, 
        "wins_to_games_ratio"=>0, 
        "more_wins_man_count"=>3, 
        "more_wins_man_ratio"=>0, 
        "rating"=>0, 
        "more_rating_man_count"=>3, 
        "place"=>4
      }
    }
      	

    it { Player.legioners.should match_array([@pras]) } 
    it { Player.jackpot.should eq(200) }
  	it { @spajic.name.should eq('Спаич') }
  	it { @pras  .name.should eq('Прас' ) }

    it { @spajic.is_legioner.should eq(false) }
    it { @pras  .is_legioner.should eq(true) }

    it { @spajic.days_count.should eq(1) }

  	it { @spajic.wins_count.should eq(2) }
  	it { @spajic.loses_count.should eq(0) }
  	it { @spajic.games_count.should eq(2) } 

  it { @spajic.wins_to_games_ratio.should eq(100) }
 	it { @pras  .wins_to_games_ratio.should eq(50) }

 	it { @spajic.more_wins_man_count.should eq(0) }
	it { @pras  .more_wins_man_count.should eq(1) }
 
	it { @spajic.more_wins_man_ratio.should eq(100) }
	it { @pras.more_wins_man_ratio.should   eq(67) }

	it { @spajic.rating.should eq(100) }
	it { @pras.rating.should eq(58) }

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

    it { @stats[0][1]['player'].should eq(@spajic) }
  	it { @stats[0][1]['wins_count'].should eq(@spajic.wins_count) }
  	it { @stats[0][1]['loses_count'].should eq(@spajic.loses_count) }
  	it { @stats[0][1]['games_count'].should eq(@spajic.games_count) }

  	it { @stats[0][1]['wins_to_games_ratio'].should eq(@spajic.wins_to_games_ratio) }
  	it { @stats[1][1]['wins_to_games_ratio'].should eq(@pras.wins_to_games_ratio) }

	it { @stats[0][1]['more_wins_man_count'].should eq(@spajic.more_wins_man_count) }
	it { @stats[1][1]['more_wins_man_count'].should eq(@pras.more_wins_man_count) }
	it { @stats[2][1]['more_wins_man_count'].should eq(@baranov.more_wins_man_count) }

	it { @stats[0][1]['more_wins_man_ratio'].should eq(@spajic.more_wins_man_ratio) }
	it { @stats[1][1]['more_wins_man_ratio'].should eq(@pras.more_wins_man_ratio) }
	
	it { @stats[0][1]['rating'].should eq(@spajic.rating) }
	it { @stats[1][1]['rating'].should eq(@pras.rating) }

	it { @stats[0][1]['more_rating_man_count'].should eq(@spajic.more_rating_man_count) }
	it { @stats[1][1]['more_rating_man_count'].should eq(@pras.more_rating_man_count) }

	it { @stats[0][1]['place'].should eq(@spajic.place) }
	it { @stats[1][1]['place'].should eq(@pras.place) }

  end
end
