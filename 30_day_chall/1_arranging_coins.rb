# Coins form the following rows:
# Give n find the number of full staircase rows that can be formed
# Every k-th row must have k coins
# Return the number of full rows
# A full row will be
1, 2, 3, 4, 5, 6
.
..
...
....
.....
......
.......
........
.........
[1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66, 78, 91, 105, 120, 136, 153, 171, 190, 210]
i+1, i+2, .... i+k < n
# Where i is the index
# k is the number of valid rows
  # k will always be less than half of n
# n is the number of coins

def arrange_coins(n)
  k = 0
  while (n -= k) > k
    k += 1
  end
  k
end
