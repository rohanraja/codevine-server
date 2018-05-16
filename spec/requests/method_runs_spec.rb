require 'rails_helper'

RSpec.describe "MethodRuns", type: :request do
  describe "GET /method_runs" do
    it "works! (now write some real specs)" do
      get method_runs_path
      expect(response).to have_http_status(200)
    end
  end
end
