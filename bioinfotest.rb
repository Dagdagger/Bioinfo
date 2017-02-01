puts "Enter an array"
a = gets.chomp()
a.split
x = a.length
$b = 0
c = Array.new
while $b < x
  if a[$b] == 'A'
    c.push('T')
  end
  if a[$b] == 'T'
    c.push('A')
  end
  if a[$b] == 'G'
    c.push('C')
  end
  if a[$b] == 'C'
    c.push('G')  
  end
  $b+=1
  
end

y = c.length

while y >= 0
  print c[y]
  y-=1
  
  
end