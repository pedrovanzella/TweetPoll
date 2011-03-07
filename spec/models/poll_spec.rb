require 'spec_helper'

describe Poll do

  before(:each) do
    @attr = { title: "Test Poll" }
  end

  it "should create a new Poll given correct parameters" do
    Poll.create!(@attr)
  end

  it "should require a title" do
    no_title_poll = Poll.new(@attr.merge( title: "" ))
    no_title_poll.should_not be_valid
  end
end
