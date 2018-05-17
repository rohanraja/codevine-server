class CodeEventsWriterService

  def self.LINE_EXEC(methodRunId, lineNo, timeStamp)

    parsedTime = Time.parse(timeStamp)
    l = LineRun.create(:lineNo => lineNo, :timeStamp => parsedTime )

    m = MethodRun.GetByMRID(methodRunId)
    m.line_runs << l
  end

  def self.METHOD_ENTER(methodRunId, fPath, methodName)

    m = MethodRun.create(:mrid => methodRunId, :relativeFilePath => fPath , :methodName => methodName)
  end
end
