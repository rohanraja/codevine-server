Given("I create a dot net app with id {string}") do |string|
  ts = CodeVineTestCase.getCase(string)
  proDir = "tmp/dotnet/#{ts.proName}"
  @projPath = File.expand_path(proDir)
  @projName = ts.proName
  createDotNetProject(proDir)
  copyCsFilesFromFolderTo("features/testdata/#{string}", proDir)
  initGitAndCommit(proDir)
end

def initGitAndCommit(proDir)
  `cd #{proDir}; git init; git add .; git commit -m "Init Commit"`
end

def copyCsFilesFromFolderTo(from, to)
  `cp #{from}/*.cs #{to}`
end

def createDotNetProject(projName)
  puts `dotnet new console -o #{projName}`
end


Given("I run the project") do
  puts `cd #{@projPath}; dotnet run`
end
