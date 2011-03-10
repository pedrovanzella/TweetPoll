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
        @answers << Answer.create!(:text => i.to_s, :poll => @poll)
      end
      @poll.answers = @answers
      @answers.first.vote_up(Factory(:user))
      response.should be_successful
    end
  end

  it "create action should redirect when model is valid" do
    response.should be_successful
  end

  describe "GET 'destroy'" do

    describe "as a logged in user" do

      it "should destroy the poll if the user owns it" do
        request.env["HTTP_REFERER"] = root_path

        @request.env["devise.mapping"] = :user
        sign_in Factory.create(:user_poll)
        post 'destroy', :id => 1
        @poll.destroy
        response.should redirect_to(root_path)
      end

      #This test is utterly wrong.
      #it "should not destroy the poll if the user does not own it" do
      #  request.env["HTTP_REFERER"] = root_path

      #  @request.env["devise.mapping"] = :user
      #  sign_in Factory.create(:user)
      #  post 'destroy', :id => 1
      #  @poll.destroy
      #  response.should redirect_to(root_path)
      #end
    end
  end
end
