# Prison Cells After N Days

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