# Prison Cells After N Days

#There are 8 prison cells in a row
  # state is 1 (occupied) or 0 (open)

# The cells occupancy change each day 
  # If a cell has two adjacent neighbours that are both occupied or both vacent
    #cell becomes occupied
    # otherwise becomes vacant

# First and last cells can't have two adjacent neighbours

# given the initial state, return the state of the prison after N days

# Input: cells = [0,1,0,1,1,0,0,1], N = 7
# Output: [0,0,1,1,0,0,0,0]
# Explanation: 
# The following table summarizes the state of the prison on each day:

# {0 => [0, 1, 0, 1, 1, 0, 0, 1],
# 1 => [0, 1, 1, 0, 0, 0, 0, 0],
# 2 => [0, 0, 0, 0, 1, 1, 1, 0],
# 3 => [0, 1, 1, 0, 0, 1, 0, 0],
# 4 => [0, 0, 0, 0, 0, 1, 0, 0],
# 5 => [0, 1, 1, 1, 0, 1, 0, 0],
# 6 => [0, 0, 1, 0, 1, 1, 0, 0],
# 7 => [0, 0, 1, 1, 0, 0, 0, 0]}

# We don't need to check the first or last cell, will always be 0
# need to always check both sides of cell to determine cell value

# return as is if N = 0
# create a current day and a previous day array
# previous day will be initial cell state
# current day will be set to empty inside the loop
  # build up the current day array by pushing values

# Iterate through N times
# Iterate 1...arr.length - 1 (will be only idx 1-6)
# On each iteration compare if idx-1 != idx+1
  # if true, then cell = 0, else cell = 1

# return the current day with 0 appended on both ends

### Too slow

def prison_after_n_days(cells, n)
  return cells if n == 0

  current_day = []
  previous_day = cells

  n.times do |day|
    current_day = [0]
    size = cells.length - 1

    (1...size).each_with_index do |cell|
      if previous_day[cell - 1] != previous_day[cell + 1]
        current_day << 0
      else
        current_day << 1
      end
    end

    previous_day = current_day << 0
  end

  current_day
end


### Second attempt
# keep a record of each day of cell states (hash table)
# Check record to see if current day is in there (key in the hash table)
  # If it is grab the day (key in the hash) of those cells
  # Find the highest day number in hash table
  # remaining days can 
  # find the remainder of days_left(n - current_day - 1) % days_saved(current_day - day_from_hash)

def prison_after_n_days(cells, n)
  return cells if n == 0

  recorded_days = {}
  previous_day = cells

  n.times do |day|
    current_day = [0]
    size = cells.length - 1

    (1...size).each_with_index do |cell|
      if previous_day[cell - 1] != previous_day[cell + 1]
        current_day << 0
      else
        current_day << 1
      end
    end
    previous_day = current_day << 0

    dayIdx = recorded_days.key(previous_day)
    return recorded_days[dayIdx + (n - day - 1) % (day - dayIdx)] if dayIdx
    
    recorded_days[day] = current_day
  end

  previous_day
end

prison_after_n_days([1,0,0,1,0,0,1,0], 1000000000)