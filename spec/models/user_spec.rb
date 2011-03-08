require 'spec_helper'

describe User do
	it { should have_many(:authentications) }
	it { should have_and_belong_to_many(:voted_polls) }
	it {should have_many(:polls)}
	it { should validate_presence_of(:name) }
end
