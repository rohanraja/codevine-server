class CodeRunEventProcessor

  @queue = "CODE_RUN_EVENTS"

  def self.perform(codeRunId, eventType, payload)
    puts "Got MESSAGE: #{codeRunId} , #{eventType} , #{payload}"
    payload = JSON.parse(payload)

    codeService = CodeEventsWriterService

    targetMethod = codeService.method(eventType)
    targetMethod.call(*payload)

  end
end
