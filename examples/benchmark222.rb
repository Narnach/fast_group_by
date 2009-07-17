#!/usr/bin/env ruby

# $ ruby -v
# ruby 1.8.6 (2007-09-24 patchlevel 111) [i686-darwin9.7.0]
#
#                            user     system      total        real
# fast_group_by 16k items  0.020000   0.000000   0.020000 (  0.023951)
# activesupport 16k items  3.530000   0.030000   3.560000 (  3.658406)
# fast_group_by 32k items  0.070000   0.000000   0.070000 (  0.067851)
# activesupport 32k items  7.170000   0.060000   7.230000 (  7.484641)
# fast_group_by 75k items  0.140000   0.000000   0.140000 (  0.153061)
# activesupport 75k items 93.650000   1.020000  94.670000 ( 99.030560)

gem 'activesupport', '=2.2.2'
load 'fg_benchmark.rb'
