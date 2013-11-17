def money_to_coins(amount)
  sum = (amount.chr == "£" ? amount.slice!(1..-1).to_f*100 : amount.slice(0..-1).to_i)
  coins = 1, 2, 5, 10, 20, 50, 100, 200
  syms = :"1p", :"2p", :"5p", :"10p", :"20p", :"50p", :"£1", :"£2"
  change = []
  remainder = sum # remainder is what is left to change
  coins.reverse.each do |c|
    num_coins, remainder = remainder.divmod(c)
    change << num_coins
  end
  string = ""
  change.reverse!.each_with_index { |n,i| string << "#{n}x#{syms[i]} " if n != 0 }
  string.strip
end

# puts money_to_coins("£1.79")
