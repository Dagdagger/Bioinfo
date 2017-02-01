puts "enter a string"

string = gets.chomp()

puts "enter another string"

counter = 0

secondstring = gets.chomp()

for i in 0..string.length
  temp = string[i]
  secondtemp = secondstring[i]
  if (temp != secondtemp)
    counter += 1
  end
end


puts counter