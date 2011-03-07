require 'spec_helper'

describe Answer do

  it { should belong_to(:poll) }
	it { should have_and_belong_to_many(:users) }
	it { should respond_to(:vote_up) }
end
