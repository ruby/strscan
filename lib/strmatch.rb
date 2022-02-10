# frozen_string_literal: true

# A string scanner that allows selecting based on multiple configured patterns.
# For example:
#
#     matcher = StringMatcher.new("1 2 3")
#     matcher.match(/\s+/) { |value| { type: :whitespace, value: } }
#     matcher.match(/\d+/) { |value| { type: :number, value: value.to_i } }
#
# The matcher configured above will match on spaces and numbers. You can then
# use this class to iterate over all of the matches, as in:
#
#     until matcher.eos?
#       case matcher.select
#       in { type: :whitespace, value: }
#         puts "SPC: \"#{value}\""
#       in { type: :number, value: }
#         puts "NUM: #{value}"
#       end
#     end
#
# For the input string given in the example above, this will output:
#
#     NUM: 1
#     SPC: " "
#     NUM: 2
#     SPC: " "
#     NUM: 3
#
class StringMatcher < StringScanner
  attr_reader :patterns # :nodoc:

  def initialize(string, fixed_anchor: false) # :nodoc:
    super(string, fixed_anchor: fixed_anchor)
    @patterns = []
  end

  # Configures one of the patterns that will be attempted when the select method
  # is called. The block given will receive the value returned by the scan
  # method if it is not nil. The pattern should be the same type as whatever you
  # would pass to the scan method. For example:
  #
  #     matcher = StringMatcher.new("1 2 3")
  #     matcher.match(/\s+/) { |value| :ws }
  #     matcher.match(/\d+/) { |value| value.to_i }
  #
  # The matcher configured in the block above will yield the symbol literal :ws
  # and numbers when the select method is called. It will return nil if neither
  # pattern is matched.
  def match(pattern, &block)
    patterns << [pattern, block]
  end

  # Runs all of the configured patterns and returns the return value of the
  # block associated with the first pattern that matches.
  def select
    patterns.find do |(pattern, block)|
      value = scan(pattern)
      break block.call(value) if value
    end
  end

  # Runs the select method until the end of the string is reached. If no block
  # is given, then an enumerator is returned.
  def select_all
    return to_enum(__method__) unless block_given?
    yield select until eos?
  end
end
