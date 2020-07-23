# Given a non empty array of ints, return the k most frequent elements

Input: nums = [1,1,1,2,2,3], k = 2
Output: [1,2]

Input: nums = [1], k = 1
Output: [1]

# k is always valid
# complexity must be better than O(n log n), where n is array size

# iterate through each number
# add it to the count hash where key is num and value is count
# find the max k by the value of hash
# transform key-value into just key (representing the number)

def top_k_frequent(nums, k)
  counts = {}
  
  nums.each do |num|
    if counts[num]
      counts[num] += 1
    else
      counts[num] = 1
    end
  end

  counts.max(k) { |a, b| a[1] <=> b[1] }
        .map { |x| x[0] }
end
