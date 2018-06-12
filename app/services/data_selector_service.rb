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



  def getExternalClassVal(vh)
    JSON.parse(vh.rawValue) 
  end

  def getInternalClassVal(vh, timeKey)
    clr = ClrClassInstance.where(:instanceId => vh.rawValue).first
    if clr == nil
      return "clrInstance ##{vh.rawValue}"
    end
    return getClassStateAtTime(clr, timeKey)
  end

  def getVal(var, vh, timeKey)
    if var.vartype == "NULL"
      return "null"
    end

    if var.vartype == "VALUE"
      return vh.rawValue 
    end

    if var.vartype == "EXTERNAL_CLASS"
      return getExternalClassVal(vh)    
    end

    if var.vartype == "INTERNAL_CLASS"
      return getInternalClassVal(vh, timeKey)    
    end

    return vh.rawValue 
  end


  def getVarStateAtTime(var, timeKey)
    sortedVals = var.value_holders.order(timeStamp: :desc)
    if sortedVals.count == 0
      return "null"
    end
    if sortedVals.last.timeStamp > timeKey
      return "null"
    end

    sortedVals.each do |vh|
      if vh.timeStamp <= timeKey
        return getVal(var, vh, timeKey)
      end
    end
    return "null"
  end

  def getClassName(var)
    if var.vartype != "INTERNAL_CLASS"
      return ""
    end
    vh = var.value_holders.order(timeStamp: :desc).first
    if vh == nil
      return ""
    end
    clr = ClrClassInstance.where(:instanceId => vh.rawValue).first
    if clr == nil
      return ""
    end
    return clr.className
  end

  def getClassStateAtTime(clr, timeKey)
    outP = {}
    clr.var_instances.each do |var|
      varKey = var.name
      clsName = getClassName(var)
      if clsName != ""
        varKey = "#{varKey} (#{clsName})"
      end
      varVal = getVarStateAtTime(var, timeKey)
      outP[varKey] = varVal
    end
    return outP
  end

  def getStateAtTime(timeKey)
    outP = {}

    clrs = ClrClassInstance.all

    clrs.each do |clr|
      clsVal = getClassStateAtTime(clr, timeKey)
      outP[clr.id] = clsVal
    end
    return outP
  end

  def getAllLocalVarsAtTime(timeKey)
    outP = {}
    
    MethodRun.all.each do |mr|
      mr.var_instances.each do |var|
        varInfo = {}
        varInfo["name"] = var.name
        varInfo["value"] = getVarStateAtTime(var, timeKey)
        outP[var.id] = varInfo
      end
    end

    return outP
  end

  def getFrameVars
    outP = {}
    timeStamps = getAllTimeStamps()
    timeStamps.insert(0,0)
    timeStamps.each do |timekey|
      allClasses = getStateAtTime(timekey)
      allVars = getAllLocalVarsAtTime(timekey)

      outP[timekey] = {:classes => allClasses, :localvars => allVars}
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
      outP << [fname, lineNo, mrstate, methodName, lr.timeStamp, lr.method_run.id]
    end
    return outP

  end

  def scopeVars
    outP = {}
    
    MethodRun.all.each do |mr|
      mrinfo = {}
      mrinfo["this"] = mr.clr_class_instance_id
      mrinfo["locals"] = getLocalVarIdList(mr)
      outP[mr.id] = mrinfo
    end

    return outP
  end

  def getLocalVarIdList(mr)
    mr.var_instances.map(&:id) 
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
