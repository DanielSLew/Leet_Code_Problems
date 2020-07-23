# Reverse bits of a given 32 bit unsigned int

Input: 00000010100101000001111010011100
Output: 00111001011110000010100101000000

Input: 11111111111111111111111111111101
Output: 10111111111111111111111111111111

# iterate 32 times
# left shift reversed
# Change last bit of reversed to 1 if least significant bit of n is 1
# right shift n

def reverse_bits(n)
  reversed_bits = 0

  32.times do |_|
    reversed_bits = reversed_bits << 1
    reversed_bits += (n & 1)
    n = n >> 1
  end

  reversed_bits
end

