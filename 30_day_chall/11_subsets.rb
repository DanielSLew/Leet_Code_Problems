# Given a set of distinct ints, nums
# return all possible subsets


nums = [1]

[
  [1],
  []
]

nums = [1,2]

[
  [1],
  [2],
  [1,2],
  []
]

Input: nums = [1,2,3]
Output:
[
  [3],
  [1],
  [2],
  [1,2,3],
  [1,3],
  [2,3],
  [1,2],
  []
]

nums = [1, 2, 3, 4]

[
  [3],
  [1],
  [2],
  [4],
  [1,2,3,4],
  [1,2,3],
  [1,3,4],
  [1,2,4]
  [2,3,4],
  [1,3],
  [2,3],
  [1,4]
  [2,4]
  [3,4]
  [1,2],
  []
]


# use recursion
# subproblem is [1,2], then [1]
# Base case is when nums length is 0, then return an empty subset

# Use a collection to keep track of subsets
# Grab the subset of nums, minus the first digit to call the function recursively
  # subsets(nums[1, nums.length - 1])

# Iterate through each of the current collection items indexes
  # add the current number to each of the current collection items
  # add the new subset(array) to the collection

# return the collection

def subsets(nums, new_subsets = [])
  return [[]] if nums.length == 0
    
  current_subsets = subsets(nums[1, nums.length - 1])

  current_subsets.each { |set| new_subsets << (set + [nums[0]]) }

  new_subsets + current_subsets 
end

