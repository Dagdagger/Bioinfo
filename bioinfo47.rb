@blosum = File.foreach('testfile.txt').map { |line| line.split(' ')}

@blosum[0].unshift(" ")

def getscore(firstletter,secondletter)
  number = @blosum[0].index(firstletter)
  secondnumber = @blosum[0].index(secondletter)
  score = @blosum[secondnumber][number]
  return score.to_i
end

def arrayputs(array)
  for i in 0..array.length
    print array[i]
    puts ""
  end
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
backtrace = Array.new(stringone.length+2){Array.new(stringtwo.length+2)}
arrowarray = Array.new(stringone.length+2){Array.new(stringtwo.length+2)}



for i in 0..matrixarray.length-1
  for j in 0..matrixarray[i].length-1
    matrixarray[i][j] = 0 
    backtrace[i][j] = 0
    arrowarray[i][j] = 0
  end
end

for i in 0..matrixarray[0].length
  matrixarray[0][i] = (-5)*i
end

for i in 0..matrixarray.length-1
    matrixarray[i][0] = (-5)*i
  end 

besti = 0
bestj = 0
best = 0

 for i in 1..arrayone.length-1
    for j in 1..arraytwo.length-1
       match = (matrixarray[i-1][j-1]) + (getscore(arrayone[i],arraytwo[j]))
       delete = (matrixarray[i-1][j]) - 5
       insert = (matrixarray[i][j-1]) - 5
        hello = [match,delete,insert,0]
        matrixarray[i][j] = hello.max
        arrowarray[i][j] = hello.index(matrixarray[i][j])
        if matrixarray[i][j] > best
          best = matrixarray[i][j]
          besti = i
          bestj = j
        end
    end
  end
  
  
  puts best
  puts besti
  puts bestj
  
  alignmenta = Array.new
  alignmentb = Array.new
  
  alpha = besti
  beta = bestj
  target = best
  counter = 0
  totalscore = 0
  
  puts arrowarray[alpha][beta]
  puts matrixarray[alpha][beta]
  puts arrayone[alpha]
  puts arraytwo[beta]

  hello = 0

  while  (totalscore < target) && (counter < 10000)
    
  if (alpha > 0) && (beta > 0) && (arrowarray[alpha][beta] == 0)
    score = getscore(arrayone[alpha],arraytwo[beta])
    totalscore = totalscore + score
    alignmenta.unshift(arrayone[alpha])
    alignmentb.unshift(arraytwo[beta])
    alpha = alpha-1
    beta = beta-1
    best = matrixarray[alpha][beta]
    counter+=1
else if (alpha > 0) && (arrowarray[alpha][beta]== 1)
  alignmenta.unshift(arrayone[alpha])
  alignmentb.unshift("-")
  alpha = alpha-1
  best = matrixarray[alpha][beta]
  totalscore = totalscore - 5
  counter+=1
else
  alignmenta.unshift("-")
  alignmentb.unshift(arraytwo[beta])
  beta = beta - 1
  best = matrixarray[alpha][beta]
  totalscore = totalscore - 5
  counter+=1

end 
end
end

alignmenta.delete("-")
alignmentb.delete("-")


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


