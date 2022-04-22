#!/usr/bin/env ruby

require 'strscan'
puts "Loaded strscan from:", *$".grep(/\/strscan\./)

require_relative 'test/lib/helper'

Dir.glob("test/strscan/**/*test_*.rb") do |test_rb|
  require File.expand_path(test_rb)
end
