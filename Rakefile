require "bundler/gem_tasks"
require "rake/testtask"

task :default => [:compile, :test]

require 'rake/extensiontask'
Rake::ExtensionTask.new("strscan")

desc "Run test"
task :test do
  ruby("run-test.rb")
end

desc "Run benchmark"
task :benchmark do
  ruby("-S",
       "benchmark-driver",
       "benchmark/scan.yaml")
end
