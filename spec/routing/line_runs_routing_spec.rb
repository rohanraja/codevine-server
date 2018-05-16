require "rails_helper"

RSpec.describe LineRunsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/line_runs").to route_to("line_runs#index")
    end

    it "routes to #new" do
      expect(:get => "/line_runs/new").to route_to("line_runs#new")
    end

    it "routes to #show" do
      expect(:get => "/line_runs/1").to route_to("line_runs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/line_runs/1/edit").to route_to("line_runs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/line_runs").to route_to("line_runs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/line_runs/1").to route_to("line_runs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/line_runs/1").to route_to("line_runs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/line_runs/1").to route_to("line_runs#destroy", :id => "1")
    end

  end
end
