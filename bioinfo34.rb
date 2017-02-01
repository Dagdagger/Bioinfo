#initialize a BLOSUM62 scoring matrix
#algorithm obtained from https://en.wikipedia.org/wiki/Needleman%E2%80%93Wunsch_algorithm

@blosum = File.foreach('testfile.txt').map { |line| line.split(' ')}

@blosum[0].unshift(" ")

def getscore(firstletter,secondletter)
  number = @blosum[0].index(firstletter)
  secondnumber = @blosum[0].index(secondletter)
  score = @blosum[secondnumber][number]
  return score.to_i
end

totalscore = 0
constantgap = false

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
toparray = Array.new(stringone.length+2){Array.new(stringtwo.length+2)}
lowarray = Array.new(stringone.length+2){Array.new(stringtwo.length+2)}



#Make a an alignment matrix to compute optimal alignement

for i in 0..matrixarray.length-1
  for j in 0..matrixarray[i].length-1
    matrixarray[i][j] = 0
    toparray[i][j] = 0
    lowarray[i][j] = 0
  end
end

for i in 0..matrixarray[0].length
  matrixarray[0][i] = (-5)*i
  toparray[0][i] = (-5)*i
  lowarray[0][i] = (-5)*i
end

for i in 0..matrixarray.length-1
    matrixarray[i][0] = (-5)*i
    toparray[i][0] = (-5)*i
    lowarray[i][0] = (-5)*i
  end 
 
arrayone.unshift(" ")  
arraytwo.unshift(" ")

gap = 5
  
  for i in 1..arrayone.length-1
    for j in 1..arraytwo.length-1
    lowarray[i][j] = [lowarray[i-1][j], (matrixarray[i-1][j] - gap)].max
    toparray[i][j] = [toparray[i][j-1], (matrixarray[i][j-1] - gap)].max
    matrixarray[i][j] = [lowarray[i][j], (matrixarray[i-1][j-1] + getscore(arrayone[i],arraytwo[j])), toparray[i][j]].max
      end
      end
  
alignmenta = Array.new
alignmentb = Array.new

gap = 5

alpha = arrayone.length-1
beta = arraytwo.length-1

#totalscore = matrixarray[alpha][beta]



while(alpha > 0 || beta > 0)
    
if (alpha > 0) && (beta > 0) && (matrixarray[alpha][beta] == (matrixarray[alpha-1][beta-1] + getscore(arrayone[alpha],arraytwo[beta])))
    score = getscore(arrayone[alpha],arraytwo[beta])
    totalscore = totalscore + score
    alignmenta.unshift(arrayone[alpha])
    gap = 5
    alignmentb.unshift(arraytwo[beta])
    alpha = alpha-1
    beta = beta-1
else if (alpha > 0) && ((matrixarray[alpha][beta]) == (lowarray[alpha][beta]))
  alignmenta.unshift(arrayone[alpha])
  alignmentb.unshift("-")
  totalscore = totalscore = gap
  gap = 0
  alpha = alpha-1
else
  alignmenta.unshift("-")
  alignmentb.unshift(arraytwo[beta])
   totalscore = totalscore = gap
   gap = 0
  beta = beta - 1
end
end
end
    
#puts ""
#print matrixarray
puts ""
print alignmenta
puts ""
print alignmentb
puts ""

puts totalscore
 
 puts ""  
 puts totalscore    
 a = alignmenta.join("")
 puts ""
 b = alignmentb.join("")
  
yup = File.open("submit.txt", 'w')

yup.write(totalscore)
yup.write("\n")
yup.write(a)
yup.write("\n")
yup.write(b)

yup.close

  
  
