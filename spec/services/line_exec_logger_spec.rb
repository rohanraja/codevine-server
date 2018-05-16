require 'rails_helper'

RSpec.describe CodeEventsWriterService do

  subject { CodeEventsWriterService }

  describe 'LineExecEvent' do

    it 'creates a LineRun object and links to MethodRun' do
      mrID = "test_id"
      lineNo = 6
      timeStamp = Time.now.strftime("%d-%m-%Y")
      mr = MethodRun.create(:mrid => mrID)

      subject.WriteLineExec(mrID, lineNo, timeStamp)
      
      l = LineRun.last
      expect(l.lineNo).to be(lineNo)

      l = mr.line_runs.first
      expect(l.lineNo).to be(lineNo)

      expect(l.timeStamp.day).to be(Time.now.utc.day)

    end

  end
end

