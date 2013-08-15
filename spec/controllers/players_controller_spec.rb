require 'spec_helper'

describe PlayersController do

  describe "GET 'index'" do
    it 'should call Player.all_sorted_by_place method' do
    	Player.should_receive(:all_sorted_by_place)
    	get :index
    end

    it 'should select Players template for rendering' do
    	Player.stub(:all_sorted_by_place) # Заменяем метод пустышкой для изоляции
    	get :index
    	response.should render_template('index')
    end

    it 'should make Player.all results available to template' do
    	fake_results = [ mock('Player') ]
    	Player.stub(:all_sorted_by_place).and_return(fake_results)
    	get :index
    	assigns(:players).should == fake_results
    end

    it "returns http success" do
      get 'index'
      response.should be_success
    end

  end

end
