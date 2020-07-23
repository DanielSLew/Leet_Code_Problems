# # Ugly Number II

# # find the n-th ugly number
# # ugly numbers are pos nums w/ only 2, 3, 5 as prime factors

# Input: n = 10
# Output: 12
# Explanation: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 is the sequence of the first 10 ugly numbers

# # 1 is an ugly number
# # n <= 1690

# 2, 3, 5

# 3 paths
# increment 2 by 2 (2, 4, 6, 8, 10, 12, 14)
# incremtn 3 by 6 (3, 9, 15, 21, 27, 33, 39, 45, 51, 57, 63, 69, 75)
# increment 5 by 10 (15, 25, 35, 45, 55), unless num - 15 % 30 equals 0

# push each number to uglynums array
# until the array reaches a certain size
# then grab the last value that is greater than the previous value
#   ie array[-1] < array[-2] then
#     array[-2] > array[-3] then return array[-2]

# until number > n

# find the min next number that is multiplied by 2, 3 or 5
# next_num min (1*2, 1*3, 1*5) = 2
# next_num min(2*2, 1*3, 1*5) = 3
# next_num min(2*2, 2*3, 1*5) = 4
# next_num min(3*2, 2*3, 1*5) = 5
# next_num min(3*2, 2*3, 2*5) = 6
# next_num min(4*2, 3*3, 2*5) = 8

# keep track of what num were on (current_n)
# keep track if a number has been added using a boolean (added)
# keep track of what 2, 3, 5 factor were on (two_count, three_count, five_count)
# loop through until current_n == n
#   if the next_num % (2 * two_count, 3 * three_count, or 5 * five_count) is 0 then
#     increment (two_count, three_count, or five_count) by 1
#     increase current_n by 1 if added = false
#     set added to true
#   at the end of loop set added to false

# Need to find the smallest number higher than the current number
  # that is attained from multiplying either 2 3 or 5

# ie if number is 6, then find number 4, multiply by 2 to get 8
# keep track of the last number used to get the new number, find the next
# highest in that list

# check up to the prime of 6... n sqrt if number is divisible by n


def nth_ugly_number(n)
  return n if n <= 6
  current_n = 6

  prev_two = 2
  prev_three = 0
  prev_five = 0

  next_number = 6

  next_two = prev_two
  next_three = prev_three
  next_five = prev_five

  until current_n == n
    next_two = (prev_two += 2) * 2 if next_two <= next_number
    next_three = (prev_three += 3) * 3 if next_three <= next_number
    next_five = (prev_five += 5) * 5 if next_five <= next_number

    next_number = [next_five, next_three, next_two].min
    current_n += 1
  end

  next_number
end

    if next_number == next_two_number
      current_n += 1
      added = true
    end

    if next_number == next_three_number
      current_n += 1 unless added
      added = true
    end

    if next_number == next_five_number
      current_n += 1 unless added
    end

def nth_ugly_number(n)
  return n if n <= 6

  current_n = 6
  next_two_number = 6
  next_three_number = 9
  next_five_number = 15
  added = false
  next_number = 6

  until current_n == n
    next_two_number *= 2 if next_two_number < next_number
    next_three_number *= 3 if next_three_number < next_number
    next_five_number *= 5 if next_five_number < next_number

    next_number = [next_five_number, next_three_number, next_two_number].min

    current_n += 1
  end

  next_number
end

puts nth_ugly_number(10)

# For the 2 case, need to find if the current number is a prime
  
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

