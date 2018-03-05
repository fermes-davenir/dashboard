require "rails_helper"

RSpec.describe PossibilitiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/possibilities").to route_to("possibilities#index")
    end

    it "routes to #new" do
      expect(:get => "/possibilities/new").to route_to("possibilities#new")
    end

    it "routes to #show" do
      expect(:get => "/possibilities/1").to route_to("possibilities#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/possibilities/1/edit").to route_to("possibilities#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/possibilities").to route_to("possibilities#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/possibilities/1").to route_to("possibilities#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/possibilities/1").to route_to("possibilities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/possibilities/1").to route_to("possibilities#destroy", :id => "1")
    end

  end
end
