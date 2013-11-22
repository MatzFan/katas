def number_to_words(n)
  words = ""
  words_arr = n.to_s.split('').each { |c| c.to_i }
  words_arr.reverse!
  units_words = %W[one two three four five six seven eight nine ten #{}]
  teens_words = %W[eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen #{}]
  tens_words = %W[ten twenty thirty forty fifty sixty seventy eighty ninety #{}]
  magnitudes = %W[ten hundred thousand #{}]
  return 'zero' if n == 0
  return teens_words[n-11] if n > 10 && n < 20
  units_map = Hash[(1..9).each.zip(units_words)]
  tens_map = Hash[(10..90).step(10).each.zip(tens_words)]

  thousands, remainder = n.divmod(1000)
  hundreds, remainder = remainder.divmod(100)
  tens, units = remainder.divmod(10)
  words_arr[3] = "#{units_words[thousands -1]} thousand" if thousands > 0
  words_arr[2] = "#{units_words[hundreds -1]} hundred" if hundreds > 0
  words_arr[1] = tens_words[tens - 1] if tens > 0
  words_arr[0] = units_words[units -1] if units > 0
  words_arr.reverse!
  # words_arr = words_arr.map {|element| 'and' if element == '0'}
  words = words_arr.join(' ').gsub('0', 'and').strip
end

puts number_to_words(18)

# 0.upto(99).each do |n|
#   puts "#{n} #{number_to_words(n)}"
# end
