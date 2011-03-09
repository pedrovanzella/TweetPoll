class HomeController < ApplicationController
	before_filter :authenticate_user!, :only => :home
  def index
		@polls = Poll.all(:limit => 5).sort_by { |p| p.relevance } .reverse!
  end

	def home
	end
	
	def show
		@user = User.find(params[:id])
	end
end
