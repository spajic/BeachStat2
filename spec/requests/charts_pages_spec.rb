require 'spec_helper'

describe "Charts pages" do
  subject { page }

  describe "rating page" do
  	before { 
    	visit '/charts/rating'
    	# Debug: save_and_open_page
    }

    it { should have_content('График рейтинга') }

  end
end
