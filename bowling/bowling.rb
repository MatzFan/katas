class Bowling

  SCORE_MAP = Hash[('1'..'9').to_a.zip(1..9)]
  SCORE_MAP['X'] = 10
  SCORE_MAP['/'] = 10
  SCORE_MAP['-'] = 0

  def initialize
    @total_score = 0
  end


  def score_for(score_card)
    score_arr = score_card.split('')
    score_arr << score_arr.last << score_arr.last
    rev_score_arr = score_arr.reverse
    rev_score_arr.each_with_index do |symbol, index|
      next if index < 2
      @second_score = SCORE_MAP[rev_score_arr[index -1]]
      @first_score = SCORE_MAP[rev_score_arr[index - 2]]
      score = parse symbol
      @total_score += score.to_i
    end
    @total_score
  end

  def parse(symbol)
    case symbol
    when ('-') then 0
    when ('1'..'9') then normal(symbol)
    when 'X'
      strike
    when '/'
      spare
    end
  end

  def normal(sym)
    sym.to_i
  end

  def strike
    @total_score += @second_score
    spare
  end

  def spare
    @total_score += @first_score
    10
  end

end #of class

# puts Bowling.new.score_for("XXXXXXXXXX")
