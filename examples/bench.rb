#!/usr/bin/env ruby
# See bench.sh for details on how to use this.
# Does a benchmarks fast_group_by vs group_by and checks that fast_group by is
# still 10x faster.
require 'rubygems'
begin
  require 'activesupport'
rescue LoadError => e
  $stderr.puts e.inspect
  exit 125
end
require 'yaml'
require 'fast_group_by'

yaml_file = File.join(File.dirname(__FILE__), 'files.yml')
ary = YAML.load_file(yaml_file)

def time(&block)
  t1 = Time.now
  block.call
  t2 = Time.now
  t2 - t1
end

fast_time = time { ary.fast_group_by {|e| e}}
slow_time = time { ary.group_by {|e| e}}
exit fast_time * 10 < slow_time ? 0 : 1