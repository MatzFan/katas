def number_to_roman_numeral(n)
  # first create array of symols representing digits
  # numbers = 1000, 500, 100, 50, 10, 5, 1
  # numerals = :M, :D, :C, :L, :X, :V, :I
  numerals = :I, :V, :X, :L, :C, :D, :M
  # num_map = Hash[numbers.zip(numerals)]
  numeral_count = 0,0,0,0,0,0,0
  by_5, numeral_count[0] = n.divmod 5 # returns quotient & modulus :)
  by_5_arr = by_5.to_s.split('').map { |c| c.to_i }
  p by_5
  # p by_5_arr
  # find all odd values of by_5_arr
  # r = by_5_arr.values_at(* by_5_arr.each_index.select { |e| e % 2 == 1 })
  r = by_5_arr.reverse
  p r
  numeral_count[1], numeral_count[2] = r[0] % 2, r[0] % 5
  numeral_count[3], numeral_count[4] = r[1] % 2, r[0] % 5
  numeral_count[5], numeral_count[6] = r[2] % 2, r[0] % 5
  # change 'M' to correctly relect 1,000's
  numeral_count[6] = n / 1000
  p numeral_count
end

number_to_roman_numeral(9448)
