class PollController < ApplicationController
	before_filter :find_poll, :except => [:create, :new]
	
  def show
  end

	def new
		@poll = Poll.new
	end

  def vote
		@answer = Answer.find(params[:answer_id])
		@answer.vote_up(current_user)
		redirect_to :back
  end

  def create
		@poll = Poll.new(params[:poll])
		if @poll.save
			flash[:notice] = "Success!"
			redirect_to root_path
		else
			flash[:alert] = "Error creating poll!"
			redirect_to root_path
		end
  end

  def destroy
		@poll.destroy
		redirect_to root_path
  end

	private 
	def find_poll
		@poll = Poll.find(params[:id])
	end

end
