class Poll < ActiveRecord::Base
  attr_accessible :title

  validates :title, :presence => true
	has_friendly_id :title, :use_slug => true
	
	belongs_to :poller
	has_and_belongs_to_many :users
  has_many :answers
	accepts_nested_attributes_for :answers

end
