require 'jekyll'

desc "Run Jekyll clean"
task :clean do
  Jekyll::Commands::Clean.process({})
end

desc "Run Jekyll build"
task :build do
  Jekyll::Commands::Build.process(:profile => true)
end

task :default => :build
