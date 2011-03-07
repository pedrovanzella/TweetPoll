require 'spec_helper'

describe Poll do

  it { should validate_presence_of(:title) }
  it { should have_many(:answers) }
  it { should belong_to(:user) }
end
