class Poll < ActiveRecord::Base
  attr_accessible :title

  validates :title, :presence => true

  has_many :answers
  belongs_to :user
end
