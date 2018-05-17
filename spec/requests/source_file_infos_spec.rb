require 'rails_helper'

RSpec.describe "SourceFileInfos", type: :request do
  describe "GET /source_file_infos" do
    it "works! (now write some real specs)" do
      get source_file_infos_path
      expect(response).to have_http_status(200)
    end
  end
end
