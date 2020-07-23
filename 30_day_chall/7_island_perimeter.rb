# Island Perimeter

# Given a map in form of two-dimen int grid
  # 1 => land
  # 0 => water

# Grid cells are connected horizontally/vertically
# The grid is completely surrounded by water

# Island doesn't have lakes
  # Water inside that isn't connected to the water around the island

# Determine the perimeter of the island
# arr.length <= 100
# arr[0].length <= 100

Input:
[[0,1,0,0],
 [1,1,1,0],
 [0,1,0,0],
 [1,1,0,0]]

Output: 16

Explanation: The perimeter is the 16 yellow stripes in the image below:

# The perimeter of each "1" is 4 minus each "1" that they are connected to

# initial perimeter is (arr.length * arr[0].length) * 4
# iterate through nested arrays
  # if 0, do nothing, if 1 then
    # remove 1 perimeter point for every "1" that is touching the current "1"
    # will check sides: array[i][j-1], array[i][j+1]
    # will check top/bottom: array[i-1][j], array[i+1][j]
# Return the perimeter

# 148ms, 12.6mem
def island_perimeter(grid)
  perimeter = 0

  grid.each_with_index do |row, i|
    row.each_with_index do |square, j|
      next if square == 0

      if j == 0
        perimeter += 1
      else
        perimeter += 1 if grid[i][j-1] == 0
      end

      if j == row.length - 1
        perimeter += 1
      else
        perimeter += 1 if grid[i][j+1] == 0
      end
      
      if i == 0
        perimeter += 1
      else
        perimeter += 1 if grid[i-1][j] == 0
      end

      if i == grid.length - 1
        perimeter += 1
      else
        perimeter += 1 if grid[i+1][j] == 0
      end
    end
  end

  perimeter
end


def island_perimeter(grid)
  perimeter = 0

  grid.each_with_index do |row, i|
    row.each_with_index do |square, j|
      next if square == 0

      perimeter += 1 if j == 0 || grid[i][j-1] == 0
      perimeter += 1 if i == 0 || grid[i-1][j] == 0

      perimeter += 1 if j == row.length - 1 || grid[i][j+1] == 0  
      perimeter += 1 if i == grid.length - 1 || grid[i+1][j] == 0
    end
  end

  perimeter
end
