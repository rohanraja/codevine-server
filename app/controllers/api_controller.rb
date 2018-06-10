class ApiController < ApplicationController

  def codefiles
    ds = DataSelectorService.new
    cf = ds.getCodeFiles
    render :json => cf
  end

  def fileruns
    ds = DataSelectorService.new
    cf = ds.getFileRuns
    render :json => cf
  end

  def codestory
    ds = DataSelectorService.new
    cf = ds.getCodeStory
    render :json => cf
  end

  def framevars
    ds = DataSelectorService.new
    cf = ds.getFrameVars
    render :json => cf
  end
end
