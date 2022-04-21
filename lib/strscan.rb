if RUBY_ENGINE == 'jruby'
  require 'strscan.jar'
  JRuby::Util.load_ext("org.jruby.ext.strscan.StringScannerLibrary")
elsif RUBY_ENGINE == 'ruby'
  require 'strscan.so'
else
  $LOAD_PATH.delete(__dir__)
  require 'strscan' # load from stdlib
end
