class CodeRunEventProcessor

  @queue = "CODE_RUN_EVENTS"

  def self.perform(codeRunId, eventType, payload)
    puts "Got MESSAGE: #{codeRunId} , #{eventType} , #{payload}"
    payload = JSON.parse(payload)

    codeService = CodeEventsWriterService
    if eventType == "LINE_EXEC"
      codeService.HandleLineExec(codeRunId, payload)
    end

    if eventType == "METHOD_ENTER"
      codeService.HandleMethodEnter(codeRunId, payload)
    end

  end
end
