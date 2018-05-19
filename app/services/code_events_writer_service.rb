class CodeEventsWriterService

  def self.LINE_EXEC(methodRunId, lineNo, timeStamp)

    l = LineRun.create(:lineNo => lineNo, :timeStamp => timeStamp )

    m = MethodRun.GetByMRID(methodRunId)
    m.line_runs << l

  end

  def self.METHOD_ENTER(methodRunId, fPath, methodName)

    m = MethodRun.create(:mrid => methodRunId, :relativeFilePath => fPath , :methodName => methodName)
  end

  def self.ADD_SOURCE_FILE(fPath, code)

    s = SourceFileInfo.create(:relativePath => fPath, :code => code)
  end

end
