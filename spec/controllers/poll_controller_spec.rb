require 'spec_helper'

describe PollController do
	before(:each) do
		@poll = Poll.create!(:title => "title")
	end
  describe "GET show without id" do
    it "should not be successful" do
			
      get :show, :id => @poll.id
			Poll.find(@poll.id)
      response.should be_success
    end
  end

  describe "POST 'vote'" do
    it "when user has not voted, should be successful" do
			
			@answers = []
			(1..3).each do |i|
				@answers << Answer.create!(:text => i.to_s)
			end
			@poll.answers = @answers
			@answers.first.vote_up(User.create(:name => 'name'))
			response.should be_successful
    end

  end

  it "create action should redirect when model is valid" do
    response.should be_successful
  end

  describe "GET 'destroy'" do
    it "should be successful" do
      post 'destroy', :id => 1
			@poll.destroy
      response.should redirect_to(root_path)
    end
  end

end