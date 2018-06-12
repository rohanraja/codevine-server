class MethodRun < ApplicationRecord
  has_many :line_runs

  has_many :methodrun_vars
  has_many :var_instances, :through => :methodrun_vars

  def self.GetByMRID(mrid)
    MethodRun.where(:mrid => mrid).first
  end

  def source_file_info
    SourceFileInfo.where(:relativePath => relativeFilePath).first
  end

end
