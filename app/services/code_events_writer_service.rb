class CodeEventsWriterService

  def self.HandleLineExec(crid, payload)
    # mrid = payload["Mrid"]
    # lineNo = payload["LineNo"]
    # timeS = payload["TimeStamp"]

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

end
