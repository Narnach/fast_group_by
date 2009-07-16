module Enumerable
  # Return a Hash with key-Array pairs. The keys are return values of the
  # block that is called with each element in the collection.
  # All elements with the same return key are added to the Array associated
  # with that key.
  def fast_group_by(&block)
    res = Hash.new { |hash, key| hash[key] = [] }
    each do |e|
      res[block.call(e)] << e
    end
    res
  end
end