require File.dirname(__FILE__) + '/../spec_helper'

describe Authentication do
  it "should be valid" do
    Authentication.create.should be_valid
  end
end
