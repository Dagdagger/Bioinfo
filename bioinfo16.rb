puts "Enter number of months"
months = gets.chomp().to_i
puts "Enter dying factor"
k = gets.chomp().to_i

mortality = Array.new
a = 1
c = 1
n = 0
j = 0

mortality[0] = 1

monthcounter = 1
while monthcounter < months
    
  j = n * 1
  puts "just born = #{j}"
    mortality.push(j)
  
  n = a + n
  puts "reproductive ready = #{n}"
  
  a = (a-a) + j
  puts "reproductive aging rabbits = #{a}"
  
  t = j + n
  puts "total = #{t}"
  
    if (mortality.length > k)
    rabbitstodie = mortality[0]
    t = t - rabbitstodie
    n = n - rabbitstodie
    mortality.shift
     end
  
  puts "rabbits that have died this month = #{rabbitstodie}"
  monthcounter+=1 
end 

puts "rabbits left at the end are #{t}"


 