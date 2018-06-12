require 'rails_helper'

RSpec.describe ApiController, type: :controller do

  describe "GET #codefiles" do
    it "returns http success" do
      
      code = "testcode"
      path = "testpath"
      sf = SourceFileInfo.create(:code => code, :relativePath => path)
      MethodRun.create(:relativeFilePath => path)

      get :codefiles

      expect(response).to have_http_status(:success)
      expect(response.body).to include(path)
      expect(response.body).to include(code)
      puts response.body
    end
  end

  describe "GET #codeStory" do
    it "returns http success" do
      path = "testpath"
      lno = 5
      thid = "199"
      time = "888"

      # ToDo: Use factory girl to create test objects
      mr = MethodRun.create(:relativeFilePath => path, :threadid => thid)
      mr.line_runs.create(:lineNo => lno, :timeStamp => time)

      get :codestory

      expect(response).to have_http_status(:success)

      expect(response.body).to include(lno.to_s)
      expect(response.body).to include(thid)
      expect(response.body).to include(path)
      expect(response.body).to include(time)

      puts response.body
    end
  end

  describe "GET #framevars" do
    it "returns http success" do

      classId = "class1"
      name = "totalCount"
      type = "raw"
      clsName = "TestClass"
      newValue = "99"
      timeStamp = "20"
      payload = [classId, name, type, clsName, newValue, timeStamp, false]

      CodeRunEventProcessor.perform("test_clr_id", "SEND_VAR_UPDATE", payload.to_json)

      get :framevars

      expect(response.body).to include(name)
      expect(response.body).to include(clsName)
      expect(response.body).to include(newValue)
      expect(response.body).to include(timeStamp)
      puts response.body

    end
  end

  describe "GET #scopeVars" do
    it "returns http success" do

      clr = ClrClassInstance.create(:instanceId => "class1")
      mr = MethodRun.create(:mrid => "mr1", :clr_class_instance_id => clr.id)

      payload = ["class1", "field1", "VALUE", "TestClass", "99", 5, "false"]
      CodeRunEventProcessor.perform("test_clr_id", "SEND_VAR_UPDATE", payload.to_json)

      payload = ["mr1", "localVar1", "VALUE", "TestClass", "200", 10, "true"]
      CodeRunEventProcessor.perform("test_clr_id", "SEND_VAR_UPDATE", payload.to_json)

      get :scopeVars

      
      expect(response.body).to include(mr.id.to_s)
      expect(response.body).to include("locals")
      expect(response.body).to include("this")
      expect(response.body).to include(VarInstance.last.id.to_s)
      puts response.body

    end
  end

end
