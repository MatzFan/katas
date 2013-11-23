class Numbers

  UNITS_WORDS = %W[#{} one two three four five six seven eight nine]
  TENS_WORDS = %W[#{} ten twenty thirty forty fifty sixty seventy eighty ninety]
  TEENS_WORDS = %W[eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]

  UNITS_MAP = Hash[Array(0..9).zip(UNITS_WORDS)]
  TENS_MAP = Hash[Array(0..9).zip(TENS_WORDS)]
  TEENS_MAP = Hash[Array(11..19).zip(TEENS_WORDS)]

  def number_to_words(number)
    six_zeros, remainder = number.divmod(1_000_000)
    three_zeros, no_zeros = remainder.divmod(1_000)

    bil_string = three_digitify(six_zeros, false)
    mil_string = three_digitify(three_zeros, false)

    check_and = (bil_string + mil_string).length < 3 ? false : true

    thou_string = three_digitify(no_zeros, check_and)

    answer_arr = string_builder([thou_string, mil_string, bil_string]).reverse!
    # aa += ' and ' if _s.length > 2 && !_s.include?('hundred')
    answer = answer_arr.join('').gsub(/\s\s/, ' ').strip
    answer = answer.gsub(/and and/, 'and') # removes duplicate ands!
  end

  def string_builder(array)
    _s, ooo_s, ooo_ooo_s = array
    if ooo_ooo_s.length > 2
      million = ' million '
    end
    array.insert(2, million)
    if ooo_s.length > 2
      thousand = ' thousand '
    end
    array.insert(1, thousand)
  end

  def three_digitify(number, check_and) # wordifies a 3 digit number
    hundreds, remainder = number.divmod(100)
    two_digit_string = two_digitify(remainder)
    string = ''
    if hundreds > 0
      string = UNITS_MAP[hundreds] + " hundred"
      string += ' and ' if two_digit_string != ' '
    elsif
      # check if final 'and' is needed
      (and_ = 'and ' if check_and)
    end
    and_ = ((check_and && two_digit_string.length > 2) ? 'and ' : '')
    string += and_ + two_digitify(remainder)
  end

  def two_digitify(number) # wordifies a 2 digit number
    return TEENS_MAP[number] if number > 10 && number < 20
    tens, units = number.divmod(10)
    TENS_MAP[tens] + " " + UNITS_MAP[units]
  end

end # of class

p Numbers.new.number_to_words(417154)
