
class Numbers

UNIT_WORDS = %W[one two three four five six seven eight nine ten #{}]
TEEN_WORDS = %W[eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen #{}]
TENS_WORDS = %W[ten twenty thirty forty fifty sixty seventy eighty ninety #{}]
# @magnitudes = %W[ten hundred thousand #{}]


  def number_to_words(n)
    words = ""
    words_arr = n.to_s.split('').each { |c| c.to_i }
    words_arr.reverse!
    return '' if n == 0
    units_map = Hash[(1..9).each.zip(UNIT_WORDS)]
    tens_map = Hash[(10..90).step(10).each.zip(TENS_WORDS)]
    hundred_thousands, remainder = n.divmod(100_000)
    ten_thousands = remainder.divmod(10000)
    thousands, remainder = remainder.divmod(1000)
    small_words_array = array(n % 1000)

    big_words_array = (n >= 1000 ? ['thousand'] : []) + array(n/1000)

    zeros = small_words_array.join('')

    has_an_and = (n >= 1000) && (words_arr[2] == '0' && !zeros.empty?) ? ['and'] : [""]

    words_arr = big_words_array.reverse!
    words_arr << has_an_and
    words_arr += small_words_array.reverse!

     # p words_arr

    words_arr.reject! { |e| e == "" || e =~ /\d/ || e.nil?}

    # p words_arr

    words_arr.reverse
    words = words_arr.join(' ').strip
    words.gsub!(/\s\s/, ' ')
    return words
  end

  def array(n)
    words_arr = []
    hundreds, remainder = n.divmod(100)
    tens, units = remainder.divmod(10)
    words_arr[2] = "#{UNIT_WORDS[hundreds -1]} hundred" if hundreds > 0
    last_two = n % 100
      if last_two > 10 && last_two < 20
        words_arr[1] = TEEN_WORDS[last_two - 11]
      else
        words_arr[1] = TENS_WORDS[tens - 1]
        words_arr[0] = UNIT_WORDS[units -1] if units > 0
      end
      # puts last_two
      if (hundreds > 0) && last_two != 0
        words_arr.insert(2, 'and')
      end
    words_arr
  end

end # of class

# puts Numbers.new.number_to_words(145254)

