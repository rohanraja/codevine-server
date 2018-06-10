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

  describe 'Class Instance Field Update Message' do
    classId = "class1"
    name = "totalCount"
    type = "raw"
    newValue = "99"
    timeStamp = "20"
    payload = [classId, name, type, newValue, timeStamp]

    after(:each) do
      clr = ClrClassInstance.last
      expect(clr.instanceId).to eq(classId)
      expect(clr.var_instances.count).to be > 0

      fi = clr.var_instances.last
      expect(fi.name).to eq(name)
      expect(fi.vartype).to eq(type)

      val = fi.value_holders.last
      expect(val.rawValue).to eq(newValue)
      expect(val.timeStamp).to eq(timeStamp)

    end

    it 'adds a value checkpoint to a field of a non existing class instance' do
      subject.perform("test_clr_id", "SEND_FIELD_UPDATE", payload.to_json)
    end


    it 'adds a value checkpoint to a field of an existing class instance but non existing field' do

      ClrClassInstance.create(:instanceId => classId)
      subject.perform("test_clr_id", "SEND_FIELD_UPDATE", payload.to_json)
    end

    it 'adds a value checkpoint to a field of an existing class instance and existing field' do
      clr = ClrClassInstance.create(:instanceId => classId)
      clr.var_instances.create(:name =>name, :vartype => type)
      subject.perform("test_clr_id", "SEND_FIELD_UPDATE", payload.to_json)
    end

  end
end


