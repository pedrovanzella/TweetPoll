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

end
