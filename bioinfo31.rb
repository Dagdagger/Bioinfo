arrayone = Array.new
arraytwo = Array.new


stringone = ""
stringtwo = ""
times = 1
counter = 0
file = File.open("goodbye.txt","rb")
file.each_line do |line|
  if (line[/^>/]) 
    counter+=1
    next
  end
  if(!line[/^>/]) && counter == 1
    appendingstring = line
    stringone << appendingstring
  end
  if(!line[/^>/]) && counter == 2
     appendingstring = line
     stringtwo << appendingstring
end
end
stringone = stringone.gsub(/\s/,"")
stringtwo = stringtwo.gsub(/\s/,"")

for i in 0..stringone.length-1
  temp = stringone[i]
  arrayone.push(temp)
end

for i in 0..stringtwo.length-1
  temp = stringtwo[i]
  arraytwo.push(temp)
end

matrixarray = Array.new(stringone.length+2){Array.new(stringtwo.length+2)}

distance = 0


for i in 0..matrixarray.length-1
  for j in 0..matrixarray[i].length-1
    matrixarray[i][j] = 0
  end
end

for i in 0..matrixarray[0].length
  matrixarray[0][i] = i* -1
end

for i in 0..matrixarray.length-1
  matrixarray[i][0] = i * -1
 end
 
 backtrace = Array.new(stringone.length+2){Array.new(stringtwo.length+2)}
 for i in 0..backtrace.length-1
  for j in 0..backtrace[i].length-1
    backtrace[i][j] = ""
  end
end
 
 arrayone.unshift(" ")  
arraytwo.unshift(" ")

print arrayone
puts ""
print arraytwo
puts ""

 for i in 1..arrayone.length-1
    for j in 1..arraytwo.length-1
        if arrayone[i] == arraytwo[j]
          match = 0
        else
          match = -1
        end
       
       matrixarray[i][j] = [(matrixarray[i-1][j-1] + match),(matrixarray[i-1][j] - 1), (matrixarray[i][j-1] - 1)].max      
       if matrixarray[i][j] == (matrixarray[i-1][j-1] + match)
         backtrace[i][j] = 0
       end
      if matrixarray[i][j] == (matrixarray[i-1][j] - 1)
        backtrace[i][j] = 1
      end
       if matrixarray[i][j] == (matrixarray[i][j-1] - 1)
        backtrace[i][j] = 2
      end      
    end
  end
  
alignmenta = Array.new
alignmentb = Array.new

alpha = arrayone.length-1
beta = arraytwo.length-1

puts arrayone.length
puts arraytwo.length

while (alpha > 0 || beta > 0)
  if backtrace[alpha][beta] == 1
    alignmenta.unshift(arrayone[alpha])
    alignmentb.unshift("-")
    alpha = alpha - 1
  else if backtrace[alpha][beta] == 2
    alignmentb.unshift(arraytwo[beta])
    alignmenta.unshift("-")
    beta = beta - 1
  else 
    alignmenta.unshift(arrayone[alpha])
    alignmentb.unshift(arraytwo[beta])
    alpha = alpha-1
    beta = beta-1
end
end
end
puts ""

for i in 0..alignmenta.length-1
  tempone = alignmenta[i]
  temptwo = alignmentb[i]
  if tempone != temptwo
    distance+=1
  end
end


#hiya = Levenshtein.distance(stringone, stringtwo)
puts ""
puts distance
a = alignmenta.join("")
puts ""
b = alignmentb.join("")
puts ""


yup = File.open("submit.txt", 'w')

yup.write(distance)
yup.write("\n")
yup.write(a)
yup.write("\n")
yup.write(b)

yup.close