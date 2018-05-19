class CodeVineTestCase

  attr_accessor :forwardWalk
  @@testCases = {}

  def self.getCase(id)
    return @@testCases[id]
  end
  
  def self.addCase(id, t)
    @@testCases[id] = t
  end
end


