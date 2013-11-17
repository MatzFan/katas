def number_to_roman_numeral(n)
  # numerals = :M, :D, :C, :L, :X, :V, :I
  numerals = :I, :V, :X, :L, :C, :D, :M
  # num_map = Hash[numbers.zip(numerals)]
  numeral_count = [0,0,0,0,0,0,0]
  # calculate n/5 and set I's
  by_5, numeral_count[0] = n.divmod 5 # gives quotient & modulus
  # split number into array of digits
  by_5_arr = by_5.to_s.split('').map { |c| c.to_i }
  rev = by_5_arr.reverse
  limit = rev.size > 3 ? 3 : rev.size
  (0...limit).each do |i|
    numeral_count[i * 2 + 2], numeral_count[i * 2 + 1] = rev[i].divmod 2
  end
  answer_arr = []
  numeral_count.each_with_index do |c,i|
    if i < 6 && c == 4 # ignore for '1,000's
      if numeral_count[i+1] == 0
        answer_arr << numerals[i+1] << numerals[i]
      else
        # means next '5' numeral is there, so this represents a '9'
        answer_arr << numerals[i+2] << numerals[i]
        # and set '5' numreral to 0
        numeral_count[i+1] = 0
      end
    else
      c.times { answer_arr << numerals[i] }
    end
  end
  answer_string = answer_arr.reverse.join('')
end
