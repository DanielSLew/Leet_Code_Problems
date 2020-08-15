Given two binary strings, return their sum (also a binary string).

The input strings are both non-empty and contains only characters 1 or 0.

Example 1:

Input: a = "11", b = "1"
Output: "100"

Example 2:

Input: a = "1010", b = "1011"
Output: "10101"


# Compare last digits, then mvoe to next digits, etc until we reach the end
# When both digits are 1, then it becomes 0 and we carry over the 1 to the next place
# When both digits are 1, and there is a carried 1, it becomes 1 and then carry over 1
# When both digits are 0, it becomes 1
# When one digit is 1 and other is 0, it becomes 1

# starting points = take the lengths of both strings and subtract 1

# keep doing this until both starting points are -1
# If starting point is less than 0, ignore that string and just use the other strings digit
# Iterate through from the end to the start using that index
# build up a new digit by following the previous rules
# subtract one from the index

def add_binary(a, b)
  a_idx = a.length - 1
  b_idx = b.length - 1

  result_str = ''
  carry = false

  until a_idx < 0 && b_idx < 0
    result = carry ? 1 : 0
    carry = false
    result += a[a_idx].to_i unless a_idx < 0
    result += b[b_idx].to_i unless b_idx < 0

    if result > 1
      carry = true
      result -= 2
    end

    result_str << result.to_s
    b_idx -= 1
    a_idx -= 1
  end

  result_str << '1' if carry
  result_str.reverse
end
