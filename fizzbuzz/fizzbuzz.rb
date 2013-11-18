def fizzbuzz(n)
  n % 3 == 0 ? f = "Fizz" : f = ""
  n % 5 == 0 ? b = "Buzz" : b = ""
  (f + b == "") ? n : f + b
end


(1..30).each { |n| fb = fizzbuzz(n); `say #{fb}` }
