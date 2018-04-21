require "rails_helper"

RSpec.describe Apiv2::RealmsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/apiv2/realms").to route_to("apiv2/realms#index")
    end


    it "routes to #show" do
      expect(:get => "/apiv2/realms/1").to route_to("apiv2/realms#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/apiv2/realms").to route_to("apiv2/realms#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/apiv2/realms/1").to route_to("apiv2/realms#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/apiv2/realms/1").to route_to("apiv2/realms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/apiv2/realms/1").to route_to("apiv2/realms#destroy", :id => "1")
    end

  end
end
