class Answer < ActiveRecord::Base
	belongs_to :poll
	
	def vote_up(user)
		self.votes ||= 0
		unless self.poll.users.include? user
			self.votes += 1
		end
		self.save
	end
end
