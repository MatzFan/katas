class Numbers

  UNITS_WORDS = %W[#{} one two three four five six seven eight nine]
  TENS_WORDS = %W[#{} ten twenty thirty forty fifty sixty seventy eighty ninety]
  TEENS_WORDS = %W[eleven twelve thirteen forteen fifteen sixteen seventeen eighteen nineteen]

  UNITS_MAP = Hash[Array(0..9).zip(UNITS_WORDS)]
  TENS_MAP = Hash[Array(0..9).zip(TENS_WORDS)]
  TEENS_MAP = Hash[Array(11..19).zip(TEENS_WORDS)]

  def number_to_words(number)
    six_zeros, remainder = number.divmod(1_000_000)
    three_zeros, no_zeros = remainder.divmod(1_000)
    two_digitify(number)

  end

  def two_digitify(number) # wordifies a 2 digit number
    return TEENS_MAP[number] if number > 10 && number < 20
    tens, units = number.divmod(10)
    TENS_MAP[tens] + " " + UNITS_MAP[units]
  end

end # of class

puts Numbers.new.number_to_words(99)
