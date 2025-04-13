# News

## 3.1.3 - 2025-04-13

### Fixes

  * `StringScanner#scan_integer`: Fixed a bug that matched data isn't
    updated.
    * GH-130
    * GH-133
    * Reported by Andrii Konchyn
    * Patch by Jean Boussier

  * `StringScanner#scan_until`: Fixed a bug that `String` pattern
    usage set incorrect match data.
    * GH-131
    * GH-138
    * Reported by Andrii Konchyn
    * Patch by NAITOH Jun

  * `StringScanner#scan_integer(base: 16)`: Fixed a bug that `0x<EOS>`
     and `0x<NON_HEX_DECIMAL>` isn't matched.
    * GH-140
    * GH-141
    * Reported by Andrii Konchyn
    * Patch by Jean Boussier

  * Fixed a bug that `String` pattern doesn't clear named captures.
    * GH-135
    * GH-142
    * Reported by Andrii Konchyn
    * Patch by NAITOH Jun

  * `StrinScanner#[]`: Fixed a bug that `String` pattern and unknown
    capture group name returns `nil` instead of raising `IndexError`
    like `Regexp` pattern.
    * GH-139
    * GH-143
    * Reported by Benoit Daloze
    * Patch by NAITOH Jun

  * `StrinScanner#pos` and `StrinScanner#pos=`: Fixed a bug that
    position is treated as `int` not `long`.
    * GH-147
    * Patch by Jean Boussier

### Thanks

  * Andrii Konchyn
  * Jean Boussier
  * NAITOH Jun

## 3.1.2 - 2024-12-15

### Fixes

  * JRuby: Fixed a bug that `StringScanner#scan_integer` may read
    out-of-bounds data.
    * GH-125
    * GH-127

  * JRuby: Fixed a wrong `StringScanner::Version` value bug.

## 3.1.1 - 2024-12-12

### Improvements

  * Added `StringScanner#scan_byte`
    * GH-89

  * Added `StringScanner#peek_byte`
    * GH-89

  * Added support for `String` pattern by the following methods:
    * `StringScanner#exist?`
    * `StringScanner#scan_until`
    * `StringScanner#skip_until`
    * `StringScanner#check_until`
    * `StringScanner#search_full`
    * GH-106
    * Patch by NAITOH Jun

  * Improved performance.
    * GH-108
    * GH-109
    * GH-110
    * Patch by NAITOH Jun

  * Improved performance.
    * GH-117

  * Added `StringScanner#scan_integer`
    * GH-113
    * GH-115
    * GH-116

### Thanks

  * NAITOH Jun

## 3.1.0 - 2024-02-04

### Fixes

  * jruby: Fixed a bug that substring can't be used.
    * GH-86
    * GH-87

## 3.0.9 - 2024-01-21

### Improvements

  * jruby: `StringScanner#rest`: Changed to use the source encoding instead of
    `US-ASCII` for empty case.
    * GH-78
    * GH-79
    * GH-80
    * Reported by NAITOH Jun

  * jruby: Dropped support for old Joni.
    * GH-76
    * Patch by Olle Jonsson

  * jruby: `StringScanner#scan`: Stopped to use shared string for result.
    * GH-83
    * GH-84
    * Reported by NAITOH Jun

### Thanks

  * NAITOH Jun

  * Olle Jonsson

## 3.0.8 - 2024-01-13

### Improvements

  * `StringScanner#captures`: Changed to return `nil` not `""` for
    unmached capture. Because `StringScanner#[]` and `MatchData#[]`
    does so.
    * GH-72
    * Patched by NAITOH Jun

### Thanks

  * NAITOH Jun

## 3.0.7 - 2023-10-11

### Improvements

  * jruby: Added support for fixed anchor.
    * GH-57

### Fixes

  * Fixed a crash bug of `StringScanner#named_capture` on not matched
    status.
    * GH-61
    * Patch by OKURA Masafumi

### Thanks

  * OKURA Masafumi

## 3.0.6 - 2023-02-08

### Improvements

  * doc: Improved `StringScanner#rest?`.
    [GH-49]
    [Patch by OKURA Masafumi]

  * jruby: Added support for joni 2.2.
    [GH-55]

### Thanks

  * OKURA Masafumi

## 3.0.5 - 2022-12-08

### Improvements

  * Added `StringScanner#named_captures`
    [GitHub#44](https://github.com/ruby/strscan/pull/44)
    [GitHub#43](https://github.com/ruby/strscan/issues/43)
    [Patch by Eriko Sugiyama]
    [Reported by Akim Demaille]

### Thanks

  * Eriko Sugiyama

  * Akim Demaille

## 3.0.4 - 2022-07-24

### Improvements

  * Added missing license files to gem.
    [GitHub#41](https://github.com/ruby/strscan/pull/41)
    [Patch by Martin Sander]

### Fixes

  * Fixed a `StringScanner#scan` bug that may not set match result on
    JRuby.
    [GitHub#45](https://github.com/ruby/strscan/pull/45)
    [Patch by Kiichi Hiromasa]

### Thanks

  * Martin Sander

  * Kiichi Hiromasa

## 3.0.3 - 2022-05-11

### Improvements

  * Improved JRuby's release process integration.
    [GitHub#39][Patch by Charles Oliver Nutter]

### Thanks

  * Charles Oliver Nutter

## 3.0.2 - 2022-05-09

### Improvements

  * Improved documentation.
    [GitHub#32][Patch by David Crosby]

  * Added support for TruffleRuby.
    [GitHub#35][Patch by Benoit Daloze]

### Thanks

  * David Crosby

  * Benoit Daloze

## 3.0.2.pre1 - 2022-04-19

### Improvements

  * Added support for JRuby.
    [GitHub#25][Patch by Charles Oliver Nutter]

### Thanks

  * Charles Oliver Nutter

## 3.0.1 - 2021-10-23

### Fixes

  * Fixed a segmentation of `StringScanner#charpos` when
    `String#byteslice` returns non string value.
    [Bug #17756][GitHub#20][Patch by Kenichi Kamiya]

### Thanks

  * Kenichi Kamiya

## 1.0.3 - 2019-10-14

### Improvements

  * Stopped depending on `regint.h`.

### Fixes

  * Fixed a bug that a build flag is ignored when this is installed by
    `gem install`.
    [GitHub#7][Reported by Michael Camilleri]

### Thanks

  * Michael Camilleri

## 1.0.2 - 2019-10-13

### Improvements

  * Added support for `String` as a pattern. This improves performance.
    [GitHub#4]

  * Improved documentation.
    [GitHub#8][Patch by Espartaco Palma]

  * Added tests for anchors.
    [GitHub#9][Patch by Jeanine Adkisson]

  * Added support for fixed anchor mode. In this mode, `\A` matches to
    the beginning of source string instead of the current
    position. `^` matches to the begging of line instead of the
    current position.

    You can use fixed anchor mode by passing `fixed_anchor: true`
    option to `StringScanner.new` such as `StringScanner.new(string,
    fixed_anchor: true)`.

    `StringScanner#fixed_anchor?` is also added to get whether fixed
    anchor mode is used or not.

    [GitHub#6][Patch by Michael Camilleri]
    [GitHub#10]

### Thanks

  * Espartaco Palma

  * Michael Camilleri

  * Jeanine Adkisson
