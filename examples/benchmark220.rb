#!/usr/bin/env ruby

# $ ruby -v
# ruby 1.8.6 (2007-09-24 patchlevel 111) [i686-darwin9.7.0]
#
#                            user     system      total        real
# fast_group_by 16k items  0.020000   0.000000   0.020000 (  0.020450)
# activesupport 16k items  3.480000   0.020000   3.500000 (  3.563153)
# fast_group_by 32k items  0.070000   0.000000   0.070000 (  0.067366)
# activesupport 32k items  7.170000   0.040000   7.210000 (  7.328533)
# fast_group_by 75k items  0.140000   0.000000   0.140000 (  0.145282)
# activesupport 75k items 88.870000   0.770000  89.640000 ( 91.505181)

gem 'activesupport', '=2.2.0'
load 'fg_benchmark.rb'
