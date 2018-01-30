require "rails_helper"

RSpec.describe Api::PartnersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/partners").to route_to("api/partners#index")
    end


    it "routes to #show" do
      expect(:get => "/api/partners/1").to route_to("api/partners#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/api/partners").to route_to("api/partners#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/partners/1").to route_to("api/partners#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/partners/1").to route_to("api/partners#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/partners/1").to route_to("api/partners#destroy", :id => "1")
    end

  end
end
