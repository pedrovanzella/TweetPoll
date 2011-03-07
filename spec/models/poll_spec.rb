require 'spec_helper'

describe Poll do

  before(:each) do
    @attr = { title: "Test Poll" }
  end

  it "should create a new Poll given correct parameters" do
    Poll.create!(@attr)
  end
end
