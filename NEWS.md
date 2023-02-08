# News

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
