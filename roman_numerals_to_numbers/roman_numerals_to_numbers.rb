def roman_numeral_to_number(numeral)
  numerals = :M, :D, :C, :L, :X, :V, :I
  numbers = 1000, 500, 100, 50, 10, 5, 1
  num_map = Hash[numerals.zip(numbers)]
  num_arr = numeral.split('')
  decimal = 0
  num_arr.each_with_index do |numeral, index|
    this_num = num_map[numeral.to_sym]
    next_num = num_map[num_arr[index + 1].to_sym] if index + 1 < num_arr.length
    next_num && next_num > this_num ? decimal -= this_num : decimal += this_num
  end
  decimal
end

# puts roman_numeral_to_number('MCD')
