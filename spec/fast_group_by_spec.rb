require File.join(File.dirname(__FILE__),%w[.. lib fast_group_by])

describe Array, '#fast_group_by' do
  it 'should return a Hash with key-Array pairs' do
    ary = (1..10).to_a
    groups = ary.fast_group_by {|e| e%2}
    groups.should == {
      0 => [2, 4, 6, 8, 10],
      1 => [1, 3, 5, 7, 9]
    }
  end
end