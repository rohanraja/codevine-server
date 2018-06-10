require 'rails_helper'

RSpec.describe "VarInstances", type: :request do
  describe "GET /var_instances" do
    it "works! (now write some real specs)" do
      get var_instances_path
      expect(response).to have_http_status(200)
    end
  end
end
