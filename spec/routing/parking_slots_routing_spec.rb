require "rails_helper"

RSpec.describe ParkingSlotsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/parking_slots").to route_to("parking_slots#index")
    end

    it "routes to #new" do
      expect(:get => "/parking_slots/new").to route_to("parking_slots#new")
    end

    it "routes to #show" do
      expect(:get => "/parking_slots/1").to route_to("parking_slots#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/parking_slots/1/edit").to route_to("parking_slots#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/parking_slots").to route_to("parking_slots#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/parking_slots/1").to route_to("parking_slots#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/parking_slots/1").to route_to("parking_slots#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/parking_slots/1").to route_to("parking_slots#destroy", :id => "1")
    end
  end
end
