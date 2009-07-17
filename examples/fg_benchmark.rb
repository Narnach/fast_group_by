require 'benchmark'
require 'activesupport'
require 'fast_group_by'
require 'yaml'

Benchmark.bm do |x|
  yaml_file = File.join(File.dirname(__FILE__),'files.yml')
  yaml_file2 = File.join(File.dirname(__FILE__),'files2.yml')
  yaml_file3 = File.join(File.dirname(__FILE__),'files3.yml')
  ary = YAML.load_file(yaml_file)
  ary2 = YAML.load_file(yaml_file2)
  ary3 = YAML.load_file(yaml_file3)
  
  # Warmup
  ary.group_by {|e| e}
  ary2.group_by {|e| e}
  ary3.group_by {|e| e}
  ary.fast_group_by {|e| e}
  ary2.fast_group_by {|e| e}
  ary3.fast_group_by {|e| e}

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

  x.report("fast_group_by 75k items") do
    1.times do
      ary3.fast_group_by { |e| e}
    end
  end
  x.report("activesupport 75k items") do
    1.times do
      ary3.group_by { |e| e}
    end
  end
end
