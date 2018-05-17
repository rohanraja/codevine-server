require 'rails_helper'

RSpec.describe CodeRunEventProcessor do

  subject { CodeRunEventProcessor }

  describe 'LineExec Message' do
    it 'creates a LineRun object and links to MethodRun' do
      mrID = "test_id"
      lineNo = 6
      timeStamp = Time.now.utc.strftime("%d-%m-%Y %z")
      mr = MethodRun.create(:mrid => mrID)

      payload = [mrID, lineNo, timeStamp]

      subject.perform("", "LINE_EXEC", payload.to_json)
      
      l = LineRun.last
      expect(l.lineNo).to be(lineNo)

      l = mr.line_runs.first
      expect(l.lineNo).to be(lineNo)

      expect(l.timeStamp.year).to be(Time.now.utc.year)
    end
  end

  describe 'MethodEnter Message' do
    it 'creates a MethodRun and links to MethodRun' do
      mrID = "test_id"
      fpath = "test_class"

      payload = [mrID, fpath, "test_method"]

      subject.perform("test_clr_id", "METHOD_ENTER", payload.to_json)
      
      m = MethodRun.last
      expect(m.mrid).to eq(mrID)
      # expect(l.lineNo).to be(lineNo)

    end
  end
end


