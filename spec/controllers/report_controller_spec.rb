require 'spec_helper'

describe ReportsController do

  describe "GET 'legioners'" do
    it 'should call Player.legioners' do 
    	Player.should_receive(:legioners) 
    	get 'legioners'
    end 
 
    it 'should select Legioners template for rendering' do
    	Player.stub(:legioners) # Заменяем метод пустышкой для изоляции
    	get 'legioners'  
    	response.should render_template('legioners')
    end 
 
    it 'should make Player.legioners results available to template' do
    	fake_results = [ mock('Player') ]
    	Player.stub(:legioners).and_return(fake_results)
    	get 'legioners' 
    	assigns(:legioners).should == fake_results
    end 

    it "returns http success" do 
      get 'legioners'  
      response.should be_success 
    end

  end

end
