class MethodRun < ApplicationRecord
  has_many :line_runs

  def self.GetByMRID(mrid)
    MethodRun.where(:mrid => mrid).first
  end

  def source_file_info
    SourceFileInfo.where(:relativePath => relativeFilePath).first
  end

end
