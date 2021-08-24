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

namespace :release do
  desc "Tasks to run on a new branch when a new branch is created"
  task :new_branch do
    require 'pathname'

    branch = ENV["RELEASE_BRANCH"]
    if branch.nil? || branch.empty?
      STDERR.puts "ERROR: You must set the env var RELEASE_BRANCH to the proper value."
      exit 1
    end

    current_branch = `git rev-parse --abbrev-ref HEAD`.chomp
    if current_branch == "master"
      STDERR.puts "ERROR: You cannot do new branch tasks from the master branch."
      exit 1
    end

    root = Pathname.new(__dir__)

    # Modify site_menu.yml
    site_menu = root.join("_data", "site_menu.yml")
    content = site_menu.read.lines
    content.each do |line|
      line.sub!(%r{(/docs/reference/)[^/]+(/)}, "\\1#{branch}\\2") unless line.match?(/^\s+prior:/)
    end
    site_menu.write(content.join)

    # Commit
    files_to_update = [site_menu]
    exit $?.exitstatus unless system("git add #{files_to_update.join(" ")}")
    exit $?.exitstatus unless system("git commit -m 'Changes for new branch #{branch}'")

    puts
    puts "The commit on #{current_branch} has been created."
    puts "Run the following to push to the upstream remote:"
    puts
    puts "\tgit push upstream #{current_branch}"
    puts
  end

  desc "Tasks to run on the master branch when a new branch is created"
  task :new_branch_master do
    require 'pathname'

    branch = ENV["RELEASE_BRANCH"]
    if branch.nil? || branch.empty?
      STDERR.puts "ERROR: You must set the env var RELEASE_BRANCH to the proper value."
      exit 1
    end

    current_branch = `git rev-parse --abbrev-ref HEAD`.chomp
    if current_branch != "master"
      STDERR.puts "ERROR: You cannot do master branch tasks from a non-master branch (#{current_branch})."
      exit 1
    end

    root = Pathname.new(__dir__)

    # Remove priors from site_menu.yml
    site_menu = root.join("_data", "site_menu.yml")
    content = site_menu.read.lines
    content.delete_if { |line| line.match?(/^\s+prior:/) }
    site_menu.write(content.join)

    # Commit
    files_to_update = [site_menu]
    exit $?.exitstatus unless system("git add #{files_to_update.join(" ")}")
    exit $?.exitstatus unless system("git commit -m 'Changes after new branch #{branch}'")

    puts
    puts "The commit on #{current_branch} has been created."
    puts "Run the following to push to the upstream remote:"
    puts
    puts "\tgit push upstream #{current_branch}"
    puts
  end
end
