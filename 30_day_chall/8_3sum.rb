# Given an array nums of n ints
# are there elements a,b,c in nums such that a + b + c = 0

# Find all unique triplets in the arr which gives the sum of zero

# Solution set must not contain duplicate triplets

Given array nums = [-1, 0, 1, 2, -1, -4],

A solution set is:
[
  [-1, 0, 1],
  [-1, -1, 2]
]

# Create an empty hash to store the values
# sort the array, [-4, -1, -1, 0, 1, 2]
# Iterate through all the numbers |x, idx|
# iterate through all the numbers again starting from the following index |y, idx+1|

# push the array of two nums to the hash as the key, and the result as the value
# push to hash, key will be the sum, value will be subarrays of array of indexes
# If key exists, push to existing array
  # this prevents us from accidentally using an number that was used already

  # { [-1, 0] => -1, [-1, 1] => 0, [-1, 2] => 1, ... }
  # { -1 => [[0, 1]], 0 => [[0, 2]], 1 => [[0, 3]], ... }
# after hash table is completed
# Iterate with idx through values again, multiply current number by -1 and then check
  # array[val], which will either return nil or an array of subarrays
  # Select only the subarrays that don't include the current idx


def three_sum(nums)
  lookup = {}
  results = {}
  nums.sort!

  nums.each_with_index do |x, idx1|
    offset = idx1 + 1
    nums[offset..-1].each_with_index do |y, idx2|
      idx2 += offset
      sum = x + y

      if lookup[sum]
        lookup[sum] << [idx1, idx2]
      else
        lookup[sum] = [[idx1, idx2]]
      end
    end
  end

  nums.each_with_index do |z, idx|
    solution = lookup[-z]

    if solution
      solution.each do |(idx_x, idx_y)|
        results[[nums[idx_x], nums[idx_y], z].sort] = 1 if (idx_x != idx) && (idx_y != idx)
      end
    end
  end

  results.keys
end


def three_sum(nums)
  three_sums = {}
  last_num = {}
  nums.each_with_index {|num, idx| last_num[num] = idx}

  length = nums.length - 1

  0.upto(length) do |idx1|
    offset = idx1 + 1
    next if (nums[idx1] == nums[idx1+1]) &&
            (nums[idx1] == nums[idx1+2]) &&
            (nums[idx1] == nums[idx1+3])

    offset.upto(length) do |idx2|
      sum = nums[idx1] + nums[idx2]
      z = last_num[-sum]

      if z && (idx1 != z) && (idx2 != z)
        three_sums[[nums[idx1], nums[idx2], -sum].sort] = 1
      end
    end
  end

  three_sums.keys
end

