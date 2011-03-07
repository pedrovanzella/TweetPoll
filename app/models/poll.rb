class Poll < ActiveRecord::Base
  attr_accessible :title

  validates :title, :presence => true
	has_friendly_id :title, :use_slug => true
	
  has_many :answers
end
