class DataSelectorService

  def getCodeFiles
    outP = {}
    
    methodRuns = MethodRun.all
    methodRuns.each do |mr|
      fname = getFileName(mr)
      code = getCode(mr)
      outP[fname] = {:code => code}
    end
    return outP
  end

  def getFileRuns
    sortedLineRuns = LineRun.all.order(timeStamp: :asc)

    outP = []
    sortedLineRuns.each do |lr|
      
      fname = getFileNameOfLineRun(lr)
      lineNo = lr.lineNo
      outP << [fname, lineNo]

    end
    return outP
  end

  def getFileNameOfLineRun(lineRun)

    return getFileName(lineRun.method_run)
  end

  def getFileName(methodRun)

    return methodRun.relativeFilePath
  end

  def getCode(methodRun)
    return methodRun.source_file_info.code
  end
end
