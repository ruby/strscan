# frozen_string_literal: true
require 'mkmf'
$INCFLAGS << " -I$(top_srcdir) -fPIC"
create_makefile 'strscan'
