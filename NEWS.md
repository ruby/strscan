# News

## 1.0.1 - 2019-10-12

### Improvements

  * Added support for `String` as a pattern. This improves performance.
    [GitHub#4]

  * Improved documentation.
    [GitHub#8][Patch by Espartaco Palma]

  * Added tests for anchors.
    [GitHub#9][Patch by Jeanine Adkisson]

### Fixes

  * Fixed a bug that `\A` and `^` are always matched. Now, `\A` is
    matched to the beginning of string and `^` is matched to the
    beginning of the line as usual.

    Note that this fix causes backward incompatibility.

    [GitHub#6][Patch by Michael Camilleri]

### Thanks

  * Espartaco Palma

  * Michael Camilleri

  * Jeanine Adkisson
