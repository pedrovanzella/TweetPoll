require 'spec_helper'

describe Answer do

  it { should belong_to(:poll) }
	it { should respond_to(:vote_up) }
end
