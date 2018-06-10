class ClrClassInstance < ApplicationRecord
  has_many :clrclass_vars
  has_many :var_instances, :through => :clrclass_vars
end
