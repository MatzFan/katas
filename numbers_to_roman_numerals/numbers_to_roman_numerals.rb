def number_to_roman_numeral(n)
  # first create array of symols representing digits
  # numbers = 1000, 500, 100, 50, 10, 5, 1
  # numerals = :M, :D, :C, :L, :X, :V, :I
  numerals = :I, :V, :X, :L, :C, :D, :M
  # num_map = Hash[numbers.zip(numerals)]
  numeral_count = [0,0,0,0,0,0,0]
  # calculate n /5 and set I's
  by_5, numeral_count[0] = n.divmod 5
  # split number into array of digits
  by_5_arr = by_5.to_s.split('').map { |c| c.to_i }
  rev = by_5_arr.reverse
  # need iterate through all elements unless array is 4 digits long
  limit = rev.size > 3 ? 3 : rev.size
  (0...limit).each do |i|
    numeral_count[i * 2 + 1], numeral_count[i * 2 + 2] = rev[i] % 2, rev[0] % 5
  end
  # change 'M' to correctly relect 1,000's for big numbers
  numeral_count[6] = n / 1000 if numeral_count.size == 7
  p numeral_count
  # loop to build string, converting '1-less' numbers as appropriate

end

number_to_roman_numeral(9448)
