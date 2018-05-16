class CodeRunEventProcessor

  @queue = "CODE_RUN_EVENTS"

  def self.perform(codeRunId, eventType, payload)
    puts "Got MESSAGE: #{codeRunId} , #{eventType} , #{payload}"
  end
end
