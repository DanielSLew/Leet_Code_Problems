# distance btwn two ints is the num of positions at which the corresponding
  # bits are diff

# given x and y, calculate the hamming distance

# a bit is not true if they are compared to each other and only one is true
  # this is an exclusive OR operation (one and only one is true to return true)

# to convert int to bit use to_s(2)

# compare two numbers with bitwise exclusive OR
# Convert result to base two
# tally up the 0s

def hamming_distance(x, y)
  dist = 0

  bits = x^y

  while bits > 0
    bits = bits >> 1
    if (bits & 1)
      dist += 1
    end
  end

  return dist
end

def hamming_distance(x, y)
  dist = x^y
  dist.to_s(2).count('1')
end

