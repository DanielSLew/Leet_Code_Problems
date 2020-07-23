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
  max_length = [x.bit_length, y.bit_length].max
  
  bitwise = x ^ y
  result = bitwise.to_s(2)

  result.rjust(max_length, '0').count('0')
end

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

# C solution

int hammingDistance(unsigned x, unsigned y)
{
    int dist = 0;
    
    for (unsigned val = x ^ y; val > 0; val = val >> 1)
    {
        if (val & 1)
            dist++;
    }

    return dist;
}

1 => 0001
2 => 0010
3 => 0011
4 => 0100
5 => 0101
6 => 0110

1 ^ 4 = 5
1 ^ 3 = 2