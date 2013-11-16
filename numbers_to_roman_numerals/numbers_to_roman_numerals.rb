def number_to_roman_numeral(n)
  # first create array of symols representing digits
  numbers = 1000, 500, 100, 50, 10, 5, 1
  numerals = :M, :D, :C, :L, :X, :V, :I
  num_map = Hash[numbers.zip(numerals)]
  p num_map
  # create hash to hold number of numerals representing the number, 0 to start
  numeral_numbers = {} #Hash[num_map.values.zip([0,0,0,0,0,0,0])]
  # first find numeral multiples
  num_map.each do |k,v|
    numeral_numbers[v] = n / k if n / k != 0
  end
  p numeral_numbers

  # digits = n.to_s.scan(/./).map { |c| c.to_i }
  # p digits
  # puts digits.each { |d| numlist[d] }
  # numlist = []
end

number_to_roman_numeral(23)
