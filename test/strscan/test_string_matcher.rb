# -*- coding: utf-8 -*-
# frozen_string_literal: true
#
# test/strscan/test_string_matcher.rb
#

require "strscan"
require "strmatch"
require "test/unit"

class TestStringMatcher < Test::Unit::TestCase
  def test_select
    matcher = StringMatcher.new("123")
    matcher.match(/\d/) { |value| value.to_i }

    assert_equal(1, matcher.select)
    assert_equal(2, matcher.select)
    assert_equal(3, matcher.select)

    assert_equal(nil, matcher.select)
    assert_equal(nil, matcher.select)
  end

  def test_single
    matcher = StringMatcher.new("123")
    matcher.match(/\d/) { |value| value.to_i }

    assert_equal([1, 2, 3], matcher.select_all.to_a)
  end

  def test_multi
    matcher = StringMatcher.new("1a2b3c")
    matcher.match(/\d/) { |value| value.to_i }
    matcher.match(/[a-z]/, &:itself)

    assert_equal([1, "a", 2, "b", 3, "c"], matcher.select_all.to_a)
  end

  def test_conflicting
    matcher = StringMatcher.new("123")
    matcher.match(/\d/) { |value| value.to_i }
    matcher.match(/\d/, &:itself)

    assert_equal([1, 2, 3], matcher.select_all.to_a)
  end
end
