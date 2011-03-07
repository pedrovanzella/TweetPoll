require 'spec_helper'

describe HomeController do
  render_views

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "should have flash messages" do
      get 'index'
      response.should have_selector("p", :class => "notice")
      response.should have_selector("p", :class => "alert")
    end
  end

	describe "GET home" do
		it "should be redirect when not logged in" do
			get 'home'
			response.should redirect_to('/users/sign_in')
		end
		
		it "should be success when logged in" do
			@request.env["devise.mapping"] = :user
			sign_in Factory.create(:user)
		  get 'home'
			response.should be_success
		end
 	end

end
