require "rails_helper"

RSpec.describe ValueHoldersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/value_holders").to route_to("value_holders#index")
    end

    it "routes to #new" do
      expect(:get => "/value_holders/new").to route_to("value_holders#new")
    end

    it "routes to #show" do
      expect(:get => "/value_holders/1").to route_to("value_holders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/value_holders/1/edit").to route_to("value_holders#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/value_holders").to route_to("value_holders#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/value_holders/1").to route_to("value_holders#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/value_holders/1").to route_to("value_holders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/value_holders/1").to route_to("value_holders#destroy", :id => "1")
    end

  end
end
