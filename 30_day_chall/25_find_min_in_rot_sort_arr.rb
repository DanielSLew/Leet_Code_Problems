# An array sorted in ascending order is rotated at some pivot
# (i.e.,  [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

# The array may contain duplicates.

Example 1:
Input: [1,3,5]
Output: 1

Example 2:
Input: [2,2,2,0,1]
Output: 0

0, 4
2

# The min ele can be located at any position in the array
# The first element that is less than the previous is the min

# Set pointers to first elem and last elem (min and max)
# Grab the midpoint elem between those two
# If that elem is less than the min elem then set max to midpoint
# If that elem is more than the min, set min to midpoint + 1
# otherwise decrease max by 1
  # This is because duplicate values are allowed

# Keep doing this while min is less than max
# return min

def find_min(nums)
  return nums[0] if nums.length == 1

  min = 0
  max = nums.length - 1

  while min < max
    mid = ((max - min) / 2) + min

    if nums[mid] < nums[max]
      max = mid
    elsif nums[mid] > nums[max]
      min = mid + 1
    else
      max -= 1
    end
  end

  nums[min]
end

