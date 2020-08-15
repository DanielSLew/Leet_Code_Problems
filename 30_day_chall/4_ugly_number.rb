# # Ugly Number II

# # find the n-th ugly number
# # ugly numbers are pos nums w/ only 2, 3, 5 as prime factors

# Input: n = 10
# Output: 12
# Explanation: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 is the sequence of the first 10 ugly numbers

# # 1 is an ugly number
# # n <= 1690
  
def next_idx(idx, factor, ugly_numbers)
  until ugly_numbers[idx] * factor > ugly_numbers.last
    idx += 1
  end

  idx
end

def nth_ugly_number(n)
  return n if n <= 6
  ugly_numbers = [1, 2, 3, 4, 5, 6]

  next_two_idx = 0
  next_three_idx = 0
  next_five_idx = 0

  until ugly_numbers.length == n    
    next_two_idx = next_idx(next_two_idx, 2, ugly_numbers)
    next_three_idx = next_idx(next_three_idx, 3, ugly_numbers)
    next_five_idx = next_idx(next_five_idx, 5, ugly_numbers)

    ugly_numbers << [ugly_numbers[next_two_idx] * 2,
                     ugly_numbers[next_three_idx] * 3,
                     ugly_numbers[next_five_idx] * 5].min
  end

  ugly_numbers.last
end

