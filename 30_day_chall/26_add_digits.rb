def add_digits(num)
  return 0 if num == 0
  digital_root = num % 9
  digital_root == 0 ? 9 : digital_root 
end

11 -> 2

38 -> 11 -> 2

199 -> 19 -> 10 -> 1