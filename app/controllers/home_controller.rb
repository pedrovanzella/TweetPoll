class HomeController < ApplicationController
	before_filter :authenticate_user!, :only => :home
  def index

  end

	def home
		
	end
	
	def show
		@user = User.find(params[:id])
	end
end
