require 'spec_helper'

describe Answer do

  it { should belong_to(:poll) }
	it { should respond_to(:vote_up) }
	it {should validate_presence_of(:text)}
end
