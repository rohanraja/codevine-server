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
      mrstate = lr.methodRunningState
      methodName = getMethodName(lr)
      threadId = getThreadID(lr)
      outP << [fname, lineNo, mrstate, methodName, threadId]
    end
    return outP
  end

  def getCodeStory
    outP = {}

    threadIds = getUniqueThreadIds()

    threadIds.each do |thid|
      outP[thid] = createThreadRun(thid)
    end
    return outP
  end

  def getVarStateAtTime(var, timeKey)
    sortedVals = var.value_holders.order(timeStamp: :desc)
    if sortedVals.count == 0
      return "null"
    end
    if sortedVals.last.timeStamp < timeKey
      return "null"
    end

    sortedVals.each do |vh|
      if vh.timeStamp <= timeKey
        return vh.rawValue
      end
    end
    return "null"
  end

  def getClassStateAtTime(clr, timeKey)
    outP = {}
    clr.var_instances.each do |var|
      outP[var.name] = getVarStateAtTime(var, timeKey)
    end
    return outP
  end

  def getStateAtTime(timeKey)
    outP = {}

    clrs = ClrClassInstance.all

    clrs.each do |clr|
      outP[clr.className] = getClassStateAtTime(clr, timeKey)
    end
    return outP
  end

  def getFrameVars
    outP = {}
    timeStamps = getAllTimeStamps()
    timeStamps.each do |timekey|
      curState = getStateAtTime(timekey)
      outP[timekey] = curState
    end
    return outP
  end

  def getAllTimeStamps()
    ValueHolder.select(:timeStamp).map(&:timeStamp).uniq
  end

  def createThreadRun(thid)

    sortedLineRuns = getLineRunsforThread(thid)
    outP = []
    sortedLineRuns.each do |lr|
      
      fname = getFileNameOfLineRun(lr)
      lineNo = lr.lineNo
      mrstate = lr.methodRunningState
      methodName = getMethodName(lr)
      threadId = getThreadID(lr)
      outP << [fname, lineNo, mrstate, methodName, lr.timeStamp]
    end
    return outP

  end

  def getUniqueThreadIds()
    MethodRun.select(:threadid).map(&:threadid).uniq
  end

  def getLineRunsforThread(thid)
    LineRun.joins(:method_run).where(:method_runs => {:threadid => thid}).order(timeStamp: :asc)
  end


  def getFileNameOfLineRun(lineRun)

    return getFileName(lineRun.method_run)
  end

  def getFileName(methodRun)

    return methodRun.relativeFilePath
  end

  def getMethodName(lineRun)

    return lineRun.method_run.methodName
  end

  def getCode(methodRun)
    return methodRun.source_file_info.code
  end

  def getThreadID(lineRun)
    return lineRun.method_run.threadid
  end
end
