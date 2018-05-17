class CodeEventsWriterService

  def self.HandleMethodEnter(crid, payload)
    mrid = payload[0]
    relativeFilePath = payload[1]
    methodName = payload[2]

    CodeEventsWriterService.WriteMethodInfo(mrid, relativeFilePath, methodName)
  end
  def self.HandleLineExec(crid, payload)
    mrid = payload[0]
    lineNo = payload[1]
    timeS = payload[2]

    CodeEventsWriterService.WriteLineExec(mrid, lineNo, timeS)
  end

  def self.WriteLineExec(methodRunId, lineNo, timeStamp)

    parsedTime = Time.parse(timeStamp)
    l = LineRun.create(:lineNo => lineNo, :timeStamp => parsedTime )

    m = MethodRun.GetByMRID(methodRunId)
    m.line_runs << l
  end

  def self.WriteMethodInfo(methodRunId, fPath, methodName)

    m = MethodRun.create(:mrid => methodRunId, :relativeFilePath => fPath , :methodName => methodName)
  end
end
