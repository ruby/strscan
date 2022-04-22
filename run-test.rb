#!/usr/bin/env ruby

$LOAD_PATH.unshift("#{__dir__}/lib")

require_relative 'test/lib/helper'

Dir.glob("test/strscan/**/*test_*.rb") do |test_rb|
  require File.expand_path(test_rb)
end
