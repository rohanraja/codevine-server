class DataSelectorService

  def getCodeFiles
    outP = {}
    
    MethodRun.all.each do |mr|
      fname = getFileName(mr)
      code = getCode(mr)
      outP[fname] = code
    end
    return outP
  end

  def getFileName(methodRun)

    return methodRun.relativeFilePath
  end

  def getCode(methodRun)
    return "code"
  end
end
