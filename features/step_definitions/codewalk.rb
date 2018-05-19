When("I visit the codewalk page") do
  visit "http://localhost:3002/codewalk"
end

Then("I wait for {int} seconds") do |s|
  # byebug
  sleep(s)
end

Then("I click on next in control panel") do
  find(:css , ".control-panel-next").click
end

def GetSelectedLine
  line = ""
  all(:css, '.active-codeline').each do |ele|
    line << ele.text
  end
  line
end

def verifyForwardWalk(walkInfo)
  walkInfo.each do |winfo|
    fname = winfo[0]
    line = winfo[1]

    puts "Checking for #{line}"
    expect(GetSelectedLine()).to have_content(line)
    expect(page).to have_content(fname)
    find(:css , ".control-panel-next").click
  end
end

Then("I perform forward walk test with id {string}") do |string|
  walks = [
    ["Program.cs", "Hello World!"],
    ["Program.cs", "Test2"],
    ["Program.cs", "GetNum"],
    ["Program.cs", "int i"],
  ]
  verifyForwardWalk(walks)
end

Then("selected line should contain {string}") do |string|
  expect(GetSelectedLine()).to have_content(string)
end
