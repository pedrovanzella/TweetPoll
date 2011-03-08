class Answer < ActiveRecord::Base
	belongs_to :poll
	
	before_create :zero_votes
	validates :text, :presence => true
	
	def vote_up(user)
		self.votes ||= 0
		unless self.poll.users.include? user
			self.votes += 1
		end
		self.save
	end
	
	private 
	def zero_votes
		self.votes ||= 0
	end
	
end
