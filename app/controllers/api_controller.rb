class ApiController < ApplicationController

  def codefiles
    ds = DataSelectorService.new
    cf = ds.getCodeFiles
    render :json => cf
    # render :json => {
    # "f1": {"code":"test line\ntest line2\ntestline4"}
    # }
  end

  def fileruns
    render :json => [
      ["f1", 0],
      ["f1", 1],
      ["f1", 2],
    ]
  end
end
