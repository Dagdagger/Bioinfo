 puts "enter something"
 string = gets.chomp()
 
string = string.split("")
 permutations = Array.new
 arrayone = Array.new
 
 
 for i in 0..string.length-1
   temp = string[i]
   arrayone.push(temp)
 end

 for i in 0..string.length-1
   permutations[i] = string[i]
 end
 
permutations = permutations.sort
hello = permutations.dup
goodbye = arrayone.dup

for j in 0..goodbye.length-1
  for i in 0..goodbye.length-1
    temp = permutations[i]
    temptwo = goodbye[i]
    b = temp.dup
    a = temptwo.dup
    tempthree = b.prepend(a)
    permutations[i] = tempthree
    end
permutations = permutations.sort

end

print permutations
puts ""

for i in 0..permutations.length-1
  temp = permutations[i]
  if temp[0] == "$"
    theone = temp
  end 
end

theone.slice!(0)

puts theone

