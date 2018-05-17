require 'rails_helper'

RSpec.describe ApiController, type: :controller do

  describe "GET #codefiles" do
    it "returns http success" do
      
      m = MethodRun.create(:relativeFilePath => :tstmrid)

      get :codefiles
      expect(response).to have_http_status(:success)
      expect(response.body).to include("tstmrid")
      puts response.body
    end
  end

  describe "GET #fileruns" do
    it "returns http success" do
      get :fileruns
      expect(response).to have_http_status(:success)
      puts response.body
    end
  end

end
