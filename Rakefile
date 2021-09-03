require "bundler/gem_tasks"
require "rake/testtask"

task :default => [:compile, :test]

namespace :version do
  desc "Bump version"
  task :bump do
    strscan_c_path = "ext/strscan/strscan.c"
    strscan_c = File.read(strscan_c_path).gsub(/STRSCAN_VERSION "(.+?)"/) do
      version = $1
      "STRSCAN_VERSION \"#{version.succ}\""
    end
    File.write(strscan_c_path, strscan_c)
  end
end

if RUBY_ENGINE == "jruby"
  require 'rake/javaextensiontask'
  Rake::JavaExtensionTask.new("strscan") do |ext|
    require 'maven/ruby/maven'
    ext.source_version = '1.8'
    ext.target_version = '1.8'
    ext.ext_dir = 'ext/java'
  end
else
  require 'rake/extensiontask'
  Rake::ExtensionTask.new("strscan")
end

desc "Run test"
task :test do
  ENV["RUBYOPT"] = "-Ilib -Itest/lib -rbundler/setup -rhelper"
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
  FileUtils.cp "../ruby/tool/lib/core_assertions.rb", "./test/lib"
  FileUtils.cp "../ruby/tool/lib/envutil.rb", "./test/lib"
  FileUtils.cp "../ruby/tool/lib/find_executable.rb", "./test/lib"
end
