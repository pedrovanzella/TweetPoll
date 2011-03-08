class PollController < ApplicationController
	before_filter :find_poll, :except => [:create, :new]
	
  def show
		@collection = {}
		@poll.answers.each do |a|
		 	@collection[a.text] = a.id
		end
  end

	def new
		@poll = Poll.new
	end

  def vote
		@answer = Answer.find(params[:poll][:answer_ids])
		if @answer.vote_up(current_user)
			@poll.users << current_user
			@answer.save
		end
		redirect_to :back
  end

  def create
		@poll = Poll.new(params[:poll])
		if @poll.save
			params['poll']['answers_attributes'].each do |answer_params|
				@answer = Answer.new(answer_params[1])
				@answer.poll_id = @poll.id
				@answer.save
			end
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
