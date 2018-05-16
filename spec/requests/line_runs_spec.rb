require 'rails_helper'

RSpec.describe "LineRuns", type: :request do
  describe "GET /line_runs" do
    it "works! (now write some real specs)" do
      get line_runs_path
      expect(response).to have_http_status(200)
    end
  end
end
