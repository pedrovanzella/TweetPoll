require File.dirname(__FILE__) + '/../spec_helper'

describe AuthenticationsController do
  fixtures :all
  render_views

  before(:each) do
    @attr = { :user_id => 1 }
  end

  it "create action should redirect when model is valid" do
    Authentication.create!(@attr)
    response.should be_successful
  end

  it "destroy action should destroy model and redirect to index action" do
    authentication = Authentication.first
    delete :destroy, :id => authentication
    response.should redirect_to(authentications_url)
    Authentication.exists?(authentication.id).should be_false
  end
end
