class User < ActiveRecord::Base
	has_many :authentications
	has_and_belongs_to_many :voted_polls, :class_name => "Poll"
	has_many :polls, :foreign_key => :poller_id
	
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :password, :password_confirmation, :remember_me

	validates :name, :presence => true
	has_friendly_id :name, :use_slug => true
end
