Given("I create a dot net app with id {string}") do |string|
  ts = CodeVineTestCase.getCase(string)
  proDir = "tmp/dotnet/#{ts.proName}"
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
  `dotnet new console -o #{projName}`
end
