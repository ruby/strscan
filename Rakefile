require "bundler/gem_tasks"
require "rake/testtask"
require "rdoc/task"

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

    strscan_java_path = "ext/jruby/org/jruby/ext/strscan/RubyStringScanner.java"
    strscan_java = File.read(strscan_java_path).gsub(/STRSCAN_VERSION = "(.+?)"/) do
      version = $1
      "STRSCAN_VERSION = \"#{version.succ}\""
    end
    File.write(strscan_java_path, strscan_java)
  end
end

if RUBY_ENGINE == "jruby"
  require 'rake/javaextensiontask'
  Rake::JavaExtensionTask.new("strscan") do |ext|
    require 'maven/ruby/maven'
    ext.source_version = '1.8'
    ext.target_version = '1.8'
    ext.ext_dir = 'ext/jruby'
  end
  extra_require_path = "ext/jruby/lib"
elsif RUBY_ENGINE == "ruby"
  require 'rake/extensiontask'
  Rake::ExtensionTask.new("strscan") do |x|
    extra_require_path = x.lib_dir.sub!(%r[(?:\A|/)\Klib(?=/|\z)]) {
      ".ext/#{RUBY_VERSION}/#{x.platform}"
    }
  end
else
  task :compile
  extra_require_path = "lib"
end

desc "Run test"
task :test do
  require 'shellwords'
  ENV["RUBYOPT"] = "-I#{extra_require_path} -rbundler/setup"
  ruby("run-test.rb", *ENV["TESTOPTS"]&.shellsplit)
end

desc "Run benchmark"
task :benchmark do
  ruby("-S",
       "benchmark-driver",
       "benchmark/scan.yaml")
end

RDoc::Task.new

release_task = Rake.application["release"]
release_task.prerequisites.delete("build")
release_task.prerequisites.delete("release:rubygem_push")
release_task_comment = release_task.comment
if release_task_comment
  release_task.clear_comments
  release_task.comment = release_task_comment.gsub(/ and build.*$/, "")
end
