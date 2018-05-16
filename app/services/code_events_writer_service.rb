class CodeEventsWriterService
  def initialize

  end

  def WriteLineExec(methodRunId, lineNo, timeStamp)

    parsedTime = Time.parse(timeStamp)
    l = LineRun.create(:lineNo => lineNo, :timeStamp => parsedTime )

    m = MethodRun.GetByMRID(methodRunId)
    m.line_runs << l
  end

end
