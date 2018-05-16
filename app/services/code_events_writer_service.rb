class CodeEventsWriterService
  def initialize

  end


  def self.HandleLineExec(crid, payload)
    mrid = payload["Mrid"]
    lineNo = payload["LineNo"]
    timeS = payload["TimeStamp"]

    CodeEventsWriterService.WriteLineExec(mrid, lineNo, timeS)

  end

  def self.WriteLineExec(methodRunId, lineNo, timeStamp)

    parsedTime = Time.parse(timeStamp)
    l = LineRun.create(:lineNo => lineNo, :timeStamp => parsedTime )

    m = MethodRun.GetByMRID(methodRunId)
    m.line_runs << l
  end

end
