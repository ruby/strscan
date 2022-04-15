if RUBY_ENGINE == 'jruby'
  require 'strscan.jar'
  JRuby::Util.load_ext("org.jruby.ext.strscan.StringScannerLibrary")
else
  require 'strscan.so'
end
