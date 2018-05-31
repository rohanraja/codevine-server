require 'rails_helper'

RSpec.describe CodeRunEventProcessor do

  subject { CodeRunEventProcessor }

  describe 'LineExec Message' do
    it 'creates a LineRun object and links to MethodRun' do
      mrID = "test_id"
      lineNo = 6
      tick = 20
      mr = MethodRun.create(:mrid => mrID)

      payload = [mrID, lineNo, tick]

      subject.perform("", "LINE_EXEC", payload.to_json)
      
      l = LineRun.last
      expect(l.lineNo).to be(lineNo)

      l = mr.line_runs.first
      expect(l.lineNo).to be(lineNo)

      expect(l.timeStamp).to be(tick)
    end
  end

  describe 'MethodEnter Message' do
    it 'creates a MethodRun and links to MethodRun' do
      mrID = "test_id"
      fpath = "test_class"
      mName = "test_method"
      tid = "998"

      payload = [mrID, fpath, mName, tid]

      subject.perform("test_clr_id", "METHOD_ENTER", payload.to_json)
      
      m = MethodRun.last
      expect(m.mrid).to eq(mrID)
      expect(m.relativeFilePath).to eq(fpath)
      expect(m.methodName).to eq(mName)
      expect(m.threadid).to eq(tid)

    end
  end

  describe 'Add SourceFile Message' do
    it 'adds a new source file info' do
      fpath = "test_class"
      code = "test_code"

      payload = [fpath, code]

      subject.perform("test_clr_id", "ADD_SOURCE_FILE", payload.to_json)
      
      m = SourceFileInfo.last

      expect(m.relativePath).to eq(fpath)
      expect(m.code).to eq(code)

    end
  end
end


