class VarInstance < ApplicationRecord
  has_many :value_holders
  has_many :clr_class_instances, :through => :clrclass_vars
  has_many :clrclass_vars
end
