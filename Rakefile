desc "Run tests by executing the ascii_binder build"
task :test do
  exec("bundle exec asciibinder build --distro manageiq")
end

task :default => :test
