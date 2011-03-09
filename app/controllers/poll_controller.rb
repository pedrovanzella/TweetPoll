class PollController < ApplicationController
	before_filter :find_poll, :except => [:create, :new]
	before_filter :authenticate_user!, :except => :show
	
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
		begin
			url = bitly.shorten("http://tweetpoll.me/#{@poll.cached_slug}").short_url
			client.update("When asked '#{@answer.poll.title}' I chose \"#{@answer.text}\"! Vote on #{url}")
		rescue
			flash[:alert] = "An error has happened! :("
		end
		redirect_to root_path
  end

  def create
		@poll = Poll.new(params[:poll])
		@poll.poller_id = current_user.id
		if @poll.save
			current_user.polls << @poll
			params['poll']['answers_attributes'].each do |answer_params|
				unless answer_params[1].empty?
					@answer = Answer.new(answer_params[1])
					@answer.poll_id = @poll.id
					@answer.save
				end
			end
			flash[:notice] = "Success!"
			begin
				url = bitly.shorten("http://tweetpoll.me//poll/#{@poll.cached_slug}").short_url
				client.update("I just asked #{@poll.title}, come and help me choose: #{url}")
			rescue
				flash[:alert] = "An error has happened! :("
			end
			redirect_to root_path
		else
			flash[:alert] = "Error creating poll!"
			redirect_to root_path
		end
  end

  def destroy
		if @poll.poller == current_user
			flash[:notice] = "Poll destroyed!"
			@poll.destroy
		else
			flash[:notice] = "You can't destroy this poll"
		end
		redirect_to root_path
  end

	private 
	def find_poll
		@poll = Poll.find(params[:id])
	end

end
