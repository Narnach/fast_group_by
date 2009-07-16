Gem::Specification.new do |s|
  # Project
  s.name         = 'fast_group_by'
  s.summary      = "Fast group_by is an Enumerable#group_by implementation that uses hash instead of OrderedHash and is thus faster, but not ordered."
  s.description  = s.summary
  s.version      = '0.1.0'
  s.date         = '2009-07-16'
  s.platform     = Gem::Platform::RUBY
  s.authors      = ["Wes Oldenbeuving"]
  s.email        = "narnach@gmail.com"
  s.homepage     = "http://www.github.com/Narnach/fast_group_by"

  # Files
  root_files     = %w[readme.rdoc Rakefile fast_group_by.gemspec]
  bin_files      = []
  lib_files      = %w[fast_group_by]
  test_files     = %w[]
  spec_files     = %w[fast_group_by]
  other_files    = %w[]
  s.bindir       = "bin"
  s.require_path = "lib"
  s.executables  = bin_files
  s.test_files   = test_files.map {|f| 'test/%s_test.rb' % f} + spec_files.map {|f| 'spec/%s_spec.rb' % f}
  s.files        = root_files + s.test_files + other_files + bin_files.map {|f| 'bin/%s' % f} + lib_files.map {|f| 'lib/%s.rb' % f}

  # rdoc
  s.has_rdoc         = true
  s.extra_rdoc_files = %w[readme.rdoc]
  s.rdoc_options << '--inline-source' << '--line-numbers' << '--main' << 'readme.rdoc'

  # Requirements
  s.required_ruby_version = ">= 1.8.0"
end
