require "rails_helper"

RSpec.describe Apiv2::UsersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/apiv2/users").to route_to("apiv2/users#index")
    end


    it "routes to #show" do
      expect(:get => "/apiv2/users/1").to route_to("apiv2/users#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/apiv2/users").to route_to("apiv2/users#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/apiv2/users/1").to route_to("apiv2/users#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/apiv2/users/1").to route_to("apiv2/users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/apiv2/users/1").to route_to("apiv2/users#destroy", :id => "1")
    end

  end
end
