class CodeVineTestCase

  attr_accessor :forwardWalk
  attr_accessor :proName
  @@testCases = {}

  def self.getCase(id)
    return @@testCases[id]
  end
  
  def self.addCase(id, t)
    @@testCases[id] = t
  end
end


