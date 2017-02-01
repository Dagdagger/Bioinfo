arrayone = Array.new

def reverse_complement(string)
  hello = string
  stringtwo = hello
  stringtwo = stringtwo.gsub('G','Z')
  stringtwo = stringtwo.gsub('C','Y')
  stringtwo = stringtwo.gsub('A','X')
  stringtwo = stringtwo.gsub('T','W')

  stringtwo = stringtwo.gsub('Z','C')
  stringtwo = stringtwo.gsub('Y','G')
  stringtwo = stringtwo.gsub('X','T')
  stringtwo = stringtwo.gsub('W','A')
  
  stringtwo = stringtwo.reverse!
  
  return stringtwo
end


File.open("goodbye.txt").each do |line|
  line = line.gsub(/\s/,"")
  arrayone.push(line)
  temp = reverse_complement(line)
  arrayone.push(temp)
end

arrayone = arrayone.uniq

arrayone = arrayone.sort


k = arrayone[0].length

yup = File.open("submit.txt", 'w')

arrayone.each do |x|
  temp = x.dup[0..k-2]
  temptwo = x.dup[1..k-1]
  yup.write("(#{temp}, #{temptwo})\n")
end

yup.close()

