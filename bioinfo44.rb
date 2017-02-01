stringone = ""


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

def chunk(string, size)
    string.scan(/.{1,#{size}}/)
end

positionarray = Array.new
lengtharray = Array.new

file = File.open("goodbye.txt","rb")
file.each_line do |line|
  if (line[/^>/]) 
    next
  end
  if(!line[/^>/])
    appendingstring = line
    stringone << appendingstring
  end
end

stringone = stringone.gsub(/\s/,"")

truelength = stringone.length
original = stringone

positions = Hash.new

for i in 4..12
  copy = original.dup
  for j in 0..truelength-1
    if j > 0
   copy.slice!(0)
   end
   hello = chunk(copy, i)
     for x in 0..hello.length-1
        temp = hello[x]
         goodbye = reverse_complement(temp)
           if (goodbye == temp) && (temp.length == i)
            position = i*x + 1 + j
             length = i
             if ((length + position) < truelength + 2)
                  positionarray.push(position)
                lengtharray.push(length)
              end
                end
             end
           end
       end
       
       
deletearray = Array.new       



for i in 0..positionarray.length
  tempone = positionarray[i]
  temptwo = lengtharray[i]
  for j in i+1..positionarray.length
    checkone = positionarray[j]
    checktwo = lengtharray[j]
    if (checkone == tempone) && (checktwo == temptwo)
       deletearray.push(j)
    end 
  end
end

for i in 0..deletearray.length-1
  number = deletearray[i]
  positionarray[number] = 0
  lengtharray[number] = 0
end



positionarray.delete(0)
lengtharray.delete(0)




yup = File.open("submit.txt", 'w')

hello = positions.keys
whatever = positions.values

=begin
for i in 0..hello.length
  tempone = hello[i]
  temptwo = whatever[i]
  yup.write("#{tempone}  #{temptwo}")
  yup.write("\n")
end
=end


for i in 0..positionarray.length
  tempone = positionarray[i]
  temptwo = lengtharray[i]
  yup.write("#{tempone}  #{temptwo}")
  yup.write("\n")
end

yup.close


