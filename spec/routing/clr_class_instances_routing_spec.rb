require "rails_helper"

RSpec.describe ClrClassInstancesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/clr_class_instances").to route_to("clr_class_instances#index")
    end

    it "routes to #new" do
      expect(:get => "/clr_class_instances/new").to route_to("clr_class_instances#new")
    end

    it "routes to #show" do
      expect(:get => "/clr_class_instances/1").to route_to("clr_class_instances#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/clr_class_instances/1/edit").to route_to("clr_class_instances#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/clr_class_instances").to route_to("clr_class_instances#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/clr_class_instances/1").to route_to("clr_class_instances#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/clr_class_instances/1").to route_to("clr_class_instances#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/clr_class_instances/1").to route_to("clr_class_instances#destroy", :id => "1")
    end

  end
end
