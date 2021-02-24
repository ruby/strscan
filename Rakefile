require "bundler/gem_tasks"
require "rake/testtask"

task :default => [:compile, :test]

require 'rake/extensiontask'
Rake::ExtensionTask.new("strscan")

desc "Run test"
task :test do
  ENV["RUBYOPT"] = "-Ilib"
  ruby("run-test.rb")
end

desc "Run benchmark"
task :benchmark do
  ruby("-S",
       "benchmark-driver",
       "benchmark/scan.yaml")
end

task :sync_tool do
  require 'fileutils'
  FileUtils.cp "../ruby/tool/lib/test/unit/core_assertions.rb", "./test/lib"
  FileUtils.cp "../ruby/tool/lib/envutil.rb", "./test/lib"
  FileUtils.cp "../ruby/tool/lib/find_executable.rb", "./test/lib"
end
