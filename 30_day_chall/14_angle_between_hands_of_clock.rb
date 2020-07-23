# Given two numbers, hours and minutes, return the smaller angle
# in degrees formed between the two hands

Input: hour = 12, minutes = 30
Output: 165

Input: hour = 3, minutes = 30
Output: 75

Input: hour = 3, minutes = 15
Output: 7.5

Input: hour = 4, minutes = 50
Output: 155

Input: hour = 12, minutes = 0
Output: 0

# minute hand has 60 position
# minute hand has 360 degrees
  # Each minute is 360/60 degrees

# Convert hour to minutes to calculate
# hour hand has 12 * 60 positions (or minutes) (because every minute moves it slightly)
# hour hand has 360 degrees
  # each minute is 360 / (12 * 60) degrees

# calculate the absolute difference between the two
# If the difference if more than half (180 deg) then subtract the diff from 360
  # This will find the smaller angle

def angle_clock(hour, minutes)
  each_minute_position = 360 / 60        # 6
  each_hour_position = 360.0 / (12 * 60) # 0.5

  hour_position = ((hour * 60.0) + minutes) * each_hour_position
  minute_position = minutes * each_minute_position

  difference = (hour_position - minute_position).abs
  difference <= 180 ? difference : 360 - difference
end

def angle_clock(hour, minutes)
  difference = (minutes * 6  - (hour * 60 + minutes) * 0.5).abs
  difference > 180 ? 360 - difference : difference
end


