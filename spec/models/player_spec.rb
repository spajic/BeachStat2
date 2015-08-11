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
	end

  # Сводку по данным fixtures можно посмотреть в файле
  # calculate_statisitcs_on_fixture_data.txt
  describe 'it work correctly on fixtures data' do
  	before  { 
  		@spajic = Player.first 
  		@pras   = Player.find(2)
      @spajic_s = {
        "wins_count"=>7, 
        "loses_count"=>0,
        "games_count"=>7, 
        "wins_to_games_ratio"=>100, 
        "more_wins_man_count"=>0, 
        "more_wins_man_ratio"=>100,
        "rating"=>100, 
        "more_rating_man_count"=>0, 
        "place"=>1
      }
      @pras_s = {
        "wins_count"=>3, 
        "loses_count"=>4, 
        "games_count"=>7, 
        "wins_to_games_ratio"=>43, 
        "more_wins_man_count"=>1, 
        "more_wins_man_ratio"=>75, 
        "rating"=>59, 
        "more_rating_man_count"=>1, 
        "place"=>2
      }
      @baranov_s = {
        "wins_count"=>2, 
        "loses_count"=>4, 
        "games_count"=>6, 
        "wins_to_games_ratio"=>33, 
        "more_wins_man_count"=>2, 
        "more_wins_man_ratio"=>50, 
        "rating"=>41, 
        "more_rating_man_count"=>2, 
        "place"=>3
      }
      @oleg_s = {
        "wins_count"=>2, 
        "loses_count"=>5, 
        "games_count"=>7, 
        "wins_to_games_ratio"=>29, 
        "more_wins_man_count"=>2, 
        "more_wins_man_ratio"=>50, 
        "rating"=>39, 
        "more_rating_man_count"=>2, 
        "place"=>4
      }
    }
      	

    it { Player.legioners.should match_array([@pras]) } 
    it { Player.jackpot.should eq(600) }
  	it { @spajic.name.should eq('Спаич') }
  	it { @pras  .name.should eq('Прас' ) }

    it { @spajic.is_legioner.should eq(false) }
    it { @pras  .is_legioner.should eq(true) }

    it { @spajic.days_count.should eq(3) }

  	it { @spajic.wins_count.should eq(7) }
  	it { @spajic.loses_count.should eq(0) }
  	it { @spajic.games_count.should eq(7) } 

  it { @spajic.wins_to_games_ratio.should eq(100) }
 	it { @pras  .wins_to_games_ratio.should eq(43) }

 	it { @spajic.more_wins_man_count.should eq(0) }
	it { @pras  .more_wins_man_count.should eq(1) }
 
	it { @spajic.more_wins_man_ratio.should eq(100) }
	it { @pras.more_wins_man_ratio.should   eq(75) }

	it { @spajic.rating.should eq(100) }
	it { @pras.rating.should eq(59) }

	it { @spajic.more_rating_man_count.should eq(0) }
	it { @pras  .more_rating_man_count.should eq(1) }

	it { @spajic.place.should eq(1) }
	it { @pras  .place.should eq(2) }

  end

end
