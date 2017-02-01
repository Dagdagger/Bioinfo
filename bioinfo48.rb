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
toparray = Array.new(stringone.length+2){Array.new(stringtwo.length+2)}
lowarray = Array.new(stringone.length+2){Array.new(stringtwo.length+2)}
backtracearray = Array.new(stringone.length+2){Array.new(stringtwo.length+2)}
arrowarray = Array.new(stringone.length+2){Array.new(stringtwo.length+2)}



#Make a an alignment matrix to compute optimal alignement


for i in 0..matrixarray.length-1
  for j in 0..matrixarray[i].length-1
    matrixarray[i][j] = 0
    toparray[i][j] = 0
    lowarray[i][j] = 0
    backtracearray[i][j] = 0
    arrowarray[i][j] = 0    
  end
end

for i in 0..matrixarray[0].length
  matrixarray[0][i] = (-11)*i
  toparray[0][i] = (-11)*i
  lowarray[0][i] = (-11)*i
end

for i in 0..matrixarray.length-1
    matrixarray[i][0] = (-11)*i
    toparray[i][0] = (-11)*i
    lowarray[i][0] = (-11)*i
  end 
 
arrayone.unshift(" ")  
arraytwo.unshift(" ")

besti = 0
bestj = 0
best = 0
  
  
  for i in 1..arrayone.length-1
    for j in 1..arraytwo.length-1
      matrixarray[i][j] = getscore(arrayone[i],arraytwo[j]) + [lowarray[i-1][j-1], matrixarray[i-1][j-1], toparray[i-1][j-1]].max
      lowarray[i][j] = [(matrixarray[i][j-1]-11), (lowarray[i][j-1]-1), (toparray[i][j-1] - 11)].max
      toparray[i][j] = [( matrixarray[i-1][j]-11), (lowarray[i-1][j]-11), (toparray[i-1][j])-1].max
      hello = [matrixarray[i][j], lowarray[i][j], toparray[i][j]]
      backtracearray[i][j] = hello.max
      arrowarray[i][j] = hello.index(backtracearray[i][j])
        if backtracearray[i][j] > best
          best = backtracearray[i][j]
          besti = i
          bestj = j
        end
       end
      end
      

  target = best + 11
  puts besti
  puts bestj
  continuing = false
  
  alignmenta = Array.new
  alignmentb = Array.new
  
  alpha = besti
  beta = bestj
  counter = 0
  totalscore = 0
  
  
  while (totalscore < target) && (counter < 10000)
    
  if (alpha > 0) && (beta > 0) && (arrowarray[alpha][beta] == 0)
    score = getscore(arrayone[alpha],arraytwo[beta])
    totalscore = totalscore + score
    continuing = false
    alignmenta.unshift(arrayone[alpha])
    alignmentb.unshift(arraytwo[beta])
    alpha = alpha-1
    beta = beta-1
else if (alpha > 0) && (arrowarray[alpha][beta]== 2)
  alignmenta.unshift(arrayone[alpha])
  alignmentb.unshift("-")
  alpha = alpha-1
  
  
if continuing
     totalscore = totalscore - 11
   end
   if !continuing 
     totalscore = totalscore - 1
     continuing = true
   end
 
else # (beta > 0) && (arrowarray[alpha][beta]== 1)
  alignmenta.unshift("-")
  alignmentb.unshift(arraytwo[beta])
 if continuing
     totalscore = totalscore - 11
  end
  if !continuing
    totalscore = totalscore - 1
    continuing = true
  end
  beta = beta - 1
end
end
end


alignmenta.delete("-")
alignmentb.delete("-")


 a = alignmenta.join("")
 puts ""
 b = alignmentb.join("")
  
yup = File.open("submit.txt", 'w')

yup.write(target)
yup.write("\n")
yup.write(a)
yup.write("\n")
yup.write(b)

yup.close