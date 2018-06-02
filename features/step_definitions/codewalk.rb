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
  walks = CodeVineTestCase.getCase(string).forwardWalk
  verifyForwardWalk(walks)
end

Then("selected line should contain {string}") do |string|
  expect(GetSelectedLine()).to have_content(string)
end

Then("I run codewalk test on app with id {string}") do |idd|
  steps %Q{
    Given I create a dot net app with id "#{idd}"
    And I clear database
    And I run codevine parser on the project
    And I run the project
    And I wait for 5 seconds
    When I visit the codewalk page
    And I wait for 2 seconds
    And I perform forward walk test with id "#{idd}"

  }
end

