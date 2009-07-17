#!/usr/bin/env ruby

# $ ruby -v
# ruby 1.8.6 (2007-09-24 patchlevel 111) [i686-darwin9.7.0]
#
#                            user     system      total        real
# fast_group_by 16k items  0.020000   0.000000   0.020000 (  0.020562)
# activesupport 16k items  3.470000   0.030000   3.500000 (  3.578769)
# fast_group_by 32k items  0.040000   0.000000   0.040000 (  0.041894)
# activesupport 32k items  7.020000   0.050000   7.070000 (  7.259612)

require 'benchmark'
gem 'activesupport', '=2.2.0'
require 'activesupport'
require 'fast_group_by'
require 'yaml'

Benchmark.bm do |x|
  yaml_file = File.join(File.dirname(__FILE__),'files.yml')
  yaml_file2 = File.join(File.dirname(__FILE__),'files2.yml')
  ary = YAML.load_file(yaml_file)
  ary2 = YAML.load_file(yaml_file2)

  # Warmup
  ary.group_by {|e| e}
  ary2.group_by {|e| e}
  ary.fast_group_by {|e| e}
  ary2.fast_group_by {|e| e}
  
  x.report("fast_group_by 16k items") do
    1.times do
      ary.fast_group_by { |e| e}
    end
  end
  x.report("activesupport 16k items") do
    1.times do
      ary.group_by { |e| e}
    end
  end

  x.report("fast_group_by 32k items") do
    1.times do
      ary2.fast_group_by { |e| e}
    end
  end
  x.report("activesupport 32k items") do
    1.times do
      ary2.group_by { |e| e}
    end
  end
end
