## Helper Methods

These helper methods display values returned by a scanner's methods.

### `put_situation(scanner)`

Display scanner's situation:

- Byte position (`#pos)`.
- Character position (`#charpos`)
- Target string (`#rest`) and size (`#rest_size`).

```
scanner = StringScanner.new('foobarbaz')
scanner.scan(/foo/)
put_situation(scanner)
# Situation:
#   pos:       3
#   charpos:   3
#   rest:      "barbaz"
#   rest_size: 6
```

### `put_match_values(scanner)`

Display the scanner's match values:

```
scanner = StringScanner.new('Fri Dec 12 1975 14:39')
pattern = /(?<wday>\w+) (?<month>\w+) (?<day>\d+) /
scanner.match?(pattern)
put_match_values(scanner)
# Basic match values:
#   matched?:       true
#   matched_size:   11
#   pre_match:      ""
#   matched  :      "Fri Dec 12 "
#   post_match:     "1975 14:39"
# Captured match values:
#   size:           4
#   captures:       ["Fri", "Dec", "12"]
#   named_captures: {"wday"=>"Fri", "month"=>"Dec", "day"=>"12"}
#   values_at:      ["Fri Dec 12 ", "Fri", "Dec", "12", nil]
#   []:
#     [0]:          "Fri Dec 12 "
#     [1]:          "Fri"
#     [2]:          "Dec"
#     [3]:          "12"
#     [4]:          nil
```

### `match_values_cleared?(scanner)`

Returns whether the scanner's match values are all properly cleared:

```
scanner = StringScanner.new('foobarbaz')
match_values_cleared?(scanner) # => true
put_match_values(scanner)
# Basic match values:
#   matched?:       false
#   matched_size:   nil
#   pre_match:      nil
#   matched  :      nil
#   post_match:     nil
# Captured match values:
#   size:           nil
#   captures:       nil
#   named_captures: {}
#   values_at:      nil
#   [0]:            nil
scanner.scan(/foo/)
match_values_cleared?(scanner) # => false
```

## The Code

```
def put_situation(scanner)
  puts '# Situation:'
  puts "#   pos:       #{scanner.pos}"
  puts "#   charpos:   #{scanner.charpos}"
  puts "#   rest:      \"#{scanner.rest}\""
  puts "#   rest_size: #{scanner.rest_size}"
end
```

```
def put_match_values(scanner)
  puts '# Basic match values:'
  puts "#   matched?:       #{scanner.send(:matched?)}"
  value = scanner.matched_size || 'nil'
  puts "#   matched_size:   #{value}"
  value = scanner.send(:pre_match)
  value = value.nil? ? 'nil' : '"' + value + '"'
  puts "#   pre_match:      #{value}"
  value = scanner.send(:matched)
  value = value.nil? ? 'nil' : '"' + value + '"'
  puts "#   matched  :      #{value}"
  value = scanner.send(:post_match)
  value = value.nil? ? 'nil' : '"' + value + '"'
  puts "#   post_match:     #{value}"
  puts '# Captured match values:'
  value = scanner.send(:size) || 'nil'
  puts "#   size:           #{value}"
  value = scanner.send(:captures) || 'nil'
  puts "#   captures:       #{value}"
  value = scanner.send(:named_captures)
  puts "#   named_captures: #{value}"
  if scanner.size.nil?
    puts "#   values_at:      #{scanner.send(:values_at, 0) || 'nil'}"
    puts "#   [0]:            #{scanner.send(:[], nil) || 'nil'}"
  else
    puts "#   values_at:      #{scanner.send(:values_at, *(0..scanner.size)) || 'nil'}"
    puts "#   []:"
    (0..scanner.size).each do |i|
      value = scanner.send(:[], i)
      value = value.nil? ? 'nil' : '"' + value + '"'
      puts "#     [#{i}]:          #{value}"
    end
  end
end
```

```
def match_values_cleared?(scanner)
  scanner.matched? == false &&
    scanner.matched_size.nil? &&
    scanner.matched.nil? &&
    scanner.pre_match.nil? &&
    scanner.post_match.nil? &&
    scanner.size.nil? &&
    scanner[0].nil? &&
    scanner.captures.nil? &&
    scanner.values_at(0..1).nil? &&
    scanner.named_captures == {}
end
```

