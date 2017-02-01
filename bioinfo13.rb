puts "Enter alphabet"

string = gets.chomp()

puts "Enter the number of changes"

number = gets.chomp.to_i

array = Array.new

for i in 0..string.length-1
  temp = string[i]
  array.push(temp)
end

hello = array.repeated_permutation(number).map(&:join)
puts hello