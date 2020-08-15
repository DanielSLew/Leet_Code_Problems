#Plus One

# given a non-empty array of digits rep a non-negative int, plus one

# The digits are stored such that the most significant digit is at the head of the list
# each element in the array contain a single digit
# Assume that the int does not contain any leading zero except the number 0 itself

[1,2,3] => [1,2,4]
[4,3,2,1] => [4,3,2,2]

[4,3,3,9] => [4,3,4,0]
[9] => [1,0]
[0] => [1]


def plus_one(digits, idx = -1)
  if digits[idx] == 9
    digits[idx] = 0
    idx -= 1
    if idx + digits.length < 0
      digits.unshift(1)
      return digits
    else
      plus_one(digits, idx)
    end
  else
    digits[idx] += 1
    return digits
  end
end

def plus_one(digits)
  digits = digits.join.to_i + 1
  digits.to_s.split('').map(&:to_i)
end