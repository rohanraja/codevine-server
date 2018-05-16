class MethodRun < ApplicationRecord
  has_many :line_runs

  def self.GetByMRID(mrid)
    MethodRun.where(:mrid => mrid).first
  end

end
