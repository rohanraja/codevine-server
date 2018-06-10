require "rails_helper"

RSpec.describe VarInstancesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/var_instances").to route_to("var_instances#index")
    end

    it "routes to #new" do
      expect(:get => "/var_instances/new").to route_to("var_instances#new")
    end

    it "routes to #show" do
      expect(:get => "/var_instances/1").to route_to("var_instances#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/var_instances/1/edit").to route_to("var_instances#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/var_instances").to route_to("var_instances#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/var_instances/1").to route_to("var_instances#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/var_instances/1").to route_to("var_instances#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/var_instances/1").to route_to("var_instances#destroy", :id => "1")
    end

  end
end
