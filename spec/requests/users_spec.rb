require 'spec_helper'
include Warden::Test::Helpers

describe "Users" do
  describe "GET /users without being logged in" do
    it "should redirect to homepage" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get users_path
      response.status.should be(302)
    end
  end

  describe "GET /users with an admin user" do
    before do
      @user = FactoryGirl.create(:user)
      @user.admin = true
      login_as @user
      @user.save
    end
    it "should get user index" do
      get users_path
      response.status.should be
    end

  end
end
