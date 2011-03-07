require 'spec_helper'

describe Poll do

  it { should validate_presence_of(:title) }
end
