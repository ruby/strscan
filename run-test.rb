#!/usr/bin/env ruby

require 'strscan'
puts "Loaded strscan from #{$".grep(/\/strscan\./).join(', ')}"
puts "Gem from #{Gem.loaded_specs["strscan"]&.full_gem_path}"

require_relative 'test/lib/helper'

Dir.glob("test/strscan/**/*test_*.rb") do |test_rb|
  require File.expand_path(test_rb)
end
