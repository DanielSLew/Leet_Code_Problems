# Given an array of nums
# Exactly two elems appear only once and all others appear twice
# Find the two elems that appear only once

# alg should run in linear complexity
# Try to solve in constant space complexity

# Need to traverse through each elem only once

# Naive approach, use a hash table to remember elems visisted
# Store results in separate variable

# When reach a number, mark it true, if we reach it again, mark it false

def single_number(nums)
  nums_lookup = {}

  nums.each { |num| nums_lookup[num] = nums_lookup[num] ? false : true }

  nums_lookup.select {|_, bool| bool}.keys
end