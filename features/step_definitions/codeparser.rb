CODEVINE_PARSER_PROJECT_PATH = "/Users/rohan/code/codevine_parser/CodeVine_Parser/CodeVine_Parser/"
Given("I run codevine parser on the project") do
  puts `cd #{CODEVINE_PARSER_PROJECT_PATH}; dotnet run #{@projPath} #{@projName}.csproj`
end


Given("I clear database") do
  puts `RAILS_ENV=development rake db:reset; rake restart`
end
