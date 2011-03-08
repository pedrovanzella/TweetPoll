require 'spec_helper'

describe Poll do

  it { should validate_presence_of(:title) }
  it { should have_many(:answers) }
	it { should have_and_belong_to_many(:users) }
end
