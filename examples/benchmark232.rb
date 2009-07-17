#!/usr/bin/env ruby

# $ ruby -v
# ruby 1.8.6 (2007-09-24 patchlevel 111) [i686-darwin9.7.0]
#
#                            user     system      total        real
# fast_group_by 16k items  0.020000   0.000000   0.020000 (  0.020217)
# activesupport 16k items  0.020000   0.000000   0.020000 (  0.020578)
# fast_group_by 32k items  0.070000   0.000000   0.070000 (  0.070560)
# activesupport 32k items  0.060000   0.000000   0.060000 (  0.066821)
# fast_group_by 75k items  0.120000   0.000000   0.120000 (  0.124707)
# activesupport 75k items  0.140000   0.000000   0.140000 (  0.143962)

gem 'activesupport', '=2.3.2'
load 'fg_benchmark.rb'
