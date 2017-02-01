require 'factorial'

  def double_fact(number)
    if number == 0 or number == 1
      return 1
    else
      return number*double_fact(number-2)
   end
 end


puts "Enter a number"

number = gets.chomp()

number = number.to_i

number = number * 2

number = number - 5

number = double_fact(number)

puts number

count = (number % 1000000)

puts count



