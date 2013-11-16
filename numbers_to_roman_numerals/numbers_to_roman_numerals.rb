def number_to_roman_numeral(n)
  numerals = :M, :D, :C, :L, :X, :V, :I
  numbers = 1, 5, 10, 50, 100, 500, 1000
  # num_map = Hash[numbers.zip(numerals)]
  numeral_count = [0,0,0,0,0,0,0]
  # calculate n /5 and set I's
  by_5, numeral_count[0] = n.divmod 5
  # split number into array of digits
  by_5_arr = by_5.to_s.split('').map { |c| c.to_i }
  rev = by_5_arr.reverse
  p rev
  # need iterate through all elements unless array is 4 digits long
  limit = rev.size > 3 ? 3 : rev.size
  (0...limit).each do |i|

    puts i
    puts rev[i]
    numeral_count[i * 2 + 2], numeral_count[i * 2 + 1] =  rev[i] / 2, rev[i] % 2



  end
  # change 'M' to correctly relect 1,000's for big numbers
  numeral_count[6] = n / 1000 if numeral_count.size == 7
  # loop to build string, converting '1-less' numbers as appropriate
  string = ""
  p numeral_count.reverse
  # reverse again to get in correct order to build string
  numeral_count.reverse.each_with_index do |n,i|
    # first determine if the string is prepended with next numeral up
    n == 4 ? string += "#{numerals[i]}#{numerals[i-1]}" : string += "#{numerals[i].to_s * n}"
  end
  string
end

puts number_to_roman_numeral(448)
