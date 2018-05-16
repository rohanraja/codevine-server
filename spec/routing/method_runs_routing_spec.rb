require "rails_helper"

RSpec.describe MethodRunsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/method_runs").to route_to("method_runs#index")
    end

    it "routes to #new" do
      expect(:get => "/method_runs/new").to route_to("method_runs#new")
    end

    it "routes to #show" do
      expect(:get => "/method_runs/1").to route_to("method_runs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/method_runs/1/edit").to route_to("method_runs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/method_runs").to route_to("method_runs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/method_runs/1").to route_to("method_runs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/method_runs/1").to route_to("method_runs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/method_runs/1").to route_to("method_runs#destroy", :id => "1")
    end

  end
end
