def score_for(score_card)
  score_arr = score_card.split('')
  total_score = 0
  score_arr.each do |score|
    total_score += score.to_i if ('1'..'9').include? score
  end
  total_score

end

p score_for('22222222222222222222')
