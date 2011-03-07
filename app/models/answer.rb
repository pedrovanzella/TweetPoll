class Answer < ActiveRecord::Base
	belongs_to :poll
	has_and_belongs_to_many :users
	
	def vote_up(user)
		self.votes ||= 0
		if self.users.include? user
			false
		else
			self.votes += 1
		end
	end
end
