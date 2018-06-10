require 'rails_helper'

RSpec.describe "ClrClassInstances", type: :request do
  describe "GET /clr_class_instances" do
    it "works! (now write some real specs)" do
      get clr_class_instances_path
      expect(response).to have_http_status(200)
    end
  end
end
