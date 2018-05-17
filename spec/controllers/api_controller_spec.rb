require 'rails_helper'

RSpec.describe ApiController, type: :controller do

  describe "GET #codefiles" do
    it "returns http success" do
      get :codefiles
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #fileruns" do
    it "returns http success" do
      get :fileruns
      expect(response).to have_http_status(:success)
    end
  end

end
