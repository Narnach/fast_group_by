#!/bin/bash
# Copy this file and bench.rb and files.yml to your git checkout of rails and
# use git bisect to find the checkout that causes the speedup of
# ActiveSupport's group_by.
#   git bisect start
#   git bisect bad v2.3.2
#   git bisect good v2.2.2
#   git bisect run ./bench.sh
#
# Uninstall all versions of ActiveSupport, then build the current git checkout's version and install it, then run the ruby benchmark script.
cd activesupport && (rm -rf pkg && rake gem && sudo gem uninstall activesupport -aI && sudo gem install --no-rdoc pkg/activesupport-*.gem) > /dev/null 2>&1 && cd ..
exec ./bench.rb