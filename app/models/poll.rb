class Poll < ActiveRecord::Base
  attr_accessible :title

  validates :title, :presence => true
	has_friendly_id :title, :use_slug => true
	
	belongs_to :poller, :class_name => "User" 
	has_and_belongs_to_many :users
  has_many :answers, :dependent => :destroy
	accepts_nested_attributes_for :answers

	def relevance
		self.answers.sum(:votes)
	end

end
