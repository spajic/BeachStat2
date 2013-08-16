require 'spec_helper'

describe PlayersController do

  describe "GET 'index'" do
    it 'should call Player.calculate_statistics method' do
    	Player.should_receive(:calculate_statistics)
    	get :index
    end

    it 'should select Players template for rendering' do
    	Player.stub(:calculate_statistics) # Заменяем метод пустышкой для изоляции
    	get :index
    	response.should render_template('index')
    end

    it 'should make Player.all results available to template' do
    	fake_results = [ mock('Player') ]
    	Player.stub(:calculate_statistics).and_return(fake_results)
    	get :index
    	assigns(:players).should == fake_results
    end

    it "returns http success" do
      get 'index'
      response.should be_success
    end

  end

end
