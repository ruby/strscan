# frozen_string_literal: true
require 'mkmf'
have_func("onig_region_memsize", "ruby.h")
$INCFLAGS << " -I$(top_srcdir)" if $extmk
create_makefile 'strscan'
