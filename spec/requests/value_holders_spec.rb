require 'rails_helper'

RSpec.describe "ValueHolders", type: :request do
  describe "GET /value_holders" do
    it "works! (now write some real specs)" do
      get value_holders_path
      expect(response).to have_http_status(200)
    end
  end
end
