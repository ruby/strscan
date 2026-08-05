source 'https://rubygems.org'

gemspec

group :development do
  gem "benchmark-driver"
  gem "rake-compiler"
  if Gem::Version.new(RUBY_VERSION) < Gem::Version.new("3.2")
    # rdoc 8 depends on rbs 4, which requires Ruby 3.2 or later.
    gem "rdoc", "< 8"
  else
    gem "rdoc"
    # rdoc 8 depends on rbs, which has no java platform gem before 4.1.0.pre.2.
    # See https://github.com/ruby/rdoc/issues/1746
    gem 'rbs', '>= 4.1.0.pre.2' if RUBY_PLATFORM == 'java'
  end
  gem "ruby-maven", :platforms => :jruby
  gem "test-unit"
  gem "test-unit-ruby-core"
end
