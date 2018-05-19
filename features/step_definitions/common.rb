
Given("I have an application and a simple component named {string}") do |compName|
  @app = create(:application, :with_components, comps: [compName])
  @app.components.where(:name => "Comp_1").first.update(:description => "Some good description of the first component")
  @component = @app.components.first
end

When("I visit the show page for that component") do
  visit "/applications/#{@component.application.id}/components/#{@component.id}"
end

When("I visit the edit page for that component") do
  visit "/applications/#{@component.application.id}/components/#{@component.id}/edit"
end

When("I click submit") do
  find('input[name="commit"]').click
end

Then("I should see {word} on that page") do |s|
  expect(page).to have_content(s)
end

Then("I should see {string} on that page") do |s|
  expect(page).to have_content(s)
end


Then("I should not see {string} on that page") do |string|
  expect(page).to_not have_content(string)
end


Given("I fill in {string} as the {word} {word}") do |string, mod, attr|
    fill_in :name => "#{mod}[#{attr}]", with: string
end


When("I fill in {string} to element {word}") do |string, w|
    fill_in w, with: string
end


Then("I clear browser cookies") do
  browser = Capybara.current_session.driver.browser
  if browser.respond_to?(:clear_cookies)
    # Rack::MockSession
    browser.clear_cookies
  elsif browser.respond_to?(:manage) and browser.manage.respond_to?(:delete_all_cookies)
    # Selenium::WebDriver
    browser.manage.delete_all_cookies
  else
    raise "Don't know how to clear cookies. Weird driver?"
  end
end


Then("I click on link {string}") do |string|
  click_link string
end

Then("I click on button {string}") do |string|
  click_button string
end


When("I fill in {string} to the dynamic list having class {string}") do |string, string2|
  all(".#{string2} input").last.set(string)
end

When("I fill in {string} to the dynamic list having class {string} which is {int} places from last") do |string, string2, int|
  inpList = all(".#{string2} input")
  inpList[-1*int].set(string)
end


Given("I visit the list of {word} page") do |word|
  visit "/#{word}"
end

Given("I visit the new {word} page") do |word|
  visit "/#{word}/new"
end

