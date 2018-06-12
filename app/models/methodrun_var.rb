class MethodrunVar < ApplicationRecord
  belongs_to :var_instance
  belongs_to :method_run
end
