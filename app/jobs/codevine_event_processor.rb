class CodeRunEventProcessor

  @queue = "CODE_RUN_EVENTS"

  def self.perform(codeRunId, eventType, payload)
    puts "Got MESSAGE: #{codeRunId} , #{eventType} , #{payload}"
    payload = JSON.parse(payload)

    if eventType == "LINE_EXEC"

      CodeEventsWriterService.HandleLineExec(codeRunId, payload)
    end

  end
end
