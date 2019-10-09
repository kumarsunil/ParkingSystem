require "rails_helper"

RSpec.describe ParkedVehicalsController, type: :routing do
  describe "routing" do
    it " to #index" do
      expect(:get => "/parked_vehicals").to route_to("parked_vehicals#index")
    end

    it "routes to #new" do
      expect(:get => "/parked_vehicals/new").to route_to("parked_vehicals#new")
    end

    it "routes to #show" do
      expect(:get => "/parked_vehicals/1").to route_to("parked_vehicals#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/parked_vehicals/1/edit").to route_to("parked_vehicals#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/parked_vehicals").to route_to("parked_vehicals#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/parked_vehicals/1").to route_to("parked_vehicals#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/parked_vehicals/1").to route_to("parked_vehicals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/parked_vehicals/1").to route_to("parked_vehicals#destroy", :id => "1")
    end
  end
end
