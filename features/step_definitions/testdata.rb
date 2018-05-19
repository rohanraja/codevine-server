t1 = CodeVineTestCase.new
t1.forwardWalk = [
    ["Program.cs", "Hello World!"],
    ["Program.cs", "Test2"],
    ["Program.cs", "GetNum"],
    ["Program.cs", "int i"],
    ["Program.cs", "i+="],
    ["Program.cs", "int j"],
    ["Program.cs", "GetMoreNum"],
  ]
CodeVineTestCase.addCase("1", t1)
