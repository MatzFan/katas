def ordered?(word)
  word.downcase == word.downcase.split('').sort.join('')
end

# p ordered?("Ello")
