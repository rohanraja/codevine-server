require 'rails_helper'

RSpec.describe CodeEventsWriterService do

  subject { CodeEventsWriterService.new }

  describe 'LineExecEvent' do

    it 'creates a LineRun object and links to MethodRun' do
      mrID = "test_id"
      lineNo = 6
      timeStamp = Time.now.strftime("%Y-%d-%m %H:%M:%S %Z")
      mr = MethodRun.create(mrid => mrID)

      subject.WriteLineExec(mrID, lineNo, timeStamp)
      
      l = LineRun.last
      expect(l.lineNo).to be(lineNo)

      l = mr.lineRuns.first
      expect(l.lineNo).to be(lineNo)

      # expect(l.timeStamp).to be(timeStamp)

    end

  end
end

