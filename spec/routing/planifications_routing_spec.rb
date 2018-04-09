require "rails_helper"

RSpec.describe PlanificationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/planifications").to route_to("planifications#index")
    end

    it "routes to #new" do
      expect(:get => "/planifications/new").to route_to("planifications#new")
    end

    it "routes to #show" do
      expect(:get => "/planifications/1").to route_to("planifications#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/planifications/1/edit").to route_to("planifications#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/planifications").to route_to("planifications#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/planifications/1").to route_to("planifications#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/planifications/1").to route_to("planifications#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/planifications/1").to route_to("planifications#destroy", :id => "1")
    end

  end
end
