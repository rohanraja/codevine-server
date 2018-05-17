require "rails_helper"

RSpec.describe SourceFileInfosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/source_file_infos").to route_to("source_file_infos#index")
    end

    it "routes to #new" do
      expect(:get => "/source_file_infos/new").to route_to("source_file_infos#new")
    end

    it "routes to #show" do
      expect(:get => "/source_file_infos/1").to route_to("source_file_infos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/source_file_infos/1/edit").to route_to("source_file_infos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/source_file_infos").to route_to("source_file_infos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/source_file_infos/1").to route_to("source_file_infos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/source_file_infos/1").to route_to("source_file_infos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/source_file_infos/1").to route_to("source_file_infos#destroy", :id => "1")
    end

  end
end
