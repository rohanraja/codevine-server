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
t1.proName = "test2"
CodeVineTestCase.addCase("1", t1)

t2 = CodeVineTestCase.new
t2.forwardWalk = [
    ["Program.cs", "ClassA"],
    ["ClassA.cs", "ClassB"],
    ["ClassB.cs", "pName"],
    ["Program.cs", "FROM MAIN"],
    ["Program.cs", "GetCount"],
    ["ClassA.cs", "return"],
  ]
t2.proName = "test_csharp"
CodeVineTestCase.addCase("2", t2)
