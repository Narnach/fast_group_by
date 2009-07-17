#!/usr/bin/env ruby

# $ ruby -v
# ruby 1.8.6 (2007-09-24 patchlevel 111) [i686-darwin9.7.0]
#
#                            user     system      total        real
# fast_group_by 16k items  0.020000   0.000000   0.020000 (  0.020068)
# activesupport 16k items  3.430000   0.020000   3.450000 (  3.531992)
# fast_group_by 32k items  0.040000   0.000000   0.040000 (  0.042866)
# activesupport 32k items  7.030000   0.060000   7.090000 (  7.325066)

require 'benchmark'
gem 'activesupport', '=2.2.2'
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
