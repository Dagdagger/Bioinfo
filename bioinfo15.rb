puts "Enter number of months"
 months = gets.chomp().to_i
puts "Enter reproductive factor"
k = gets.chomp().to_i

a = 1
c = 1
n = 0
j = 0
monthcounter = 1
while monthcounter < months
  j = n * k
  puts "just born = #{j}"
  
  n = a + n
  puts "reproductive ready = #{n}"
  
  a = (a-a) + j
  puts "aging rabbits = #{a}"
  
  t = j + n
  puts "total = #{t}"
 
  monthcounter+=1 
end 

puts t


 

