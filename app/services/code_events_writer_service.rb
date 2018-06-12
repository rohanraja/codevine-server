class CodeEventsWriterService

  def self.LINE_EXEC(methodRunId, lineNo, timeStamp, methodRunningState="RUNNING", threadId = "-1")

    l = LineRun.create(:lineNo => lineNo, :timeStamp => timeStamp, :methodRunningState => methodRunningState)

    m = MethodRun.GetByMRID(methodRunId)
    m.line_runs << l

  end

  def self.METHOD_ENTER(methodRunId, fPath, methodName, threadId = "-1", clrInstanceId="1")

    clr = ClrClassInstance.where(:instanceId => clrInstanceId).first
    if clr == nil
        clr = ClrClassInstance.create(:instanceId => clrInstanceId)
    end

    m = MethodRun.create(:mrid => methodRunId, 
                         :relativeFilePath => fPath , 
                         :methodName => methodName, 
                         :threadid => threadId,
                         :clr_class_instance_id => clr.id
                        )
  end

  def self.ADD_SOURCE_FILE(fPath, code)

    s = SourceFileInfo.create(:relativePath => fPath, :code => code)
  end

  def self.SEND_VAR_UPDATE(clrInstanceId, varName, varType, className, newValue, timeStamp, isLocal)

    if isLocal == "true" || isLocal == "True"
      clr = MethodRun.where(:mrid => clrInstanceId).first
      if clr == nil
        clr = MethodRun.create(:mrid => clrInstanceId)
      end
    else

      clr = ClrClassInstance.where(:instanceId => clrInstanceId).first
      if clr == nil
        clr = ClrClassInstance.create(:instanceId => clrInstanceId, :className => className)
      else
        if clr.className == nil || clr.className == ""
          clr.update(:className => className)
        end
      end
    end

    varInst = clr.var_instances.where(:name => varName).first
    if varInst == nil
      varInst = VarInstance.create(:name => varName, :vartype => varType)
      clr.var_instances << varInst
    else
      if varInst.vartype == "NULL"
        varInst.update(:vartype => varType)
      end
    end

    varInst.value_holders.create(:rawValue => newValue, :timeStamp => timeStamp)

  end

end
