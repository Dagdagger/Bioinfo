codeOne = {"TTT" => 'F', "TCT" => 'S',"TAT" => 'Y', "TGT" => 'C',
           "TTC" => 'F',       "TCC" => 'S',       "TAC" => 'Y',       "TGC" =>  'C',   
           "TTA" => 'L',       "TCA" => 'S',       "TAA" => '*',       "TGA" =>  '*',   
           "TTG" => 'L',       "TCG" => 'S',       "TAG"  => '*',       "TGG" => 'W',
           "CTT" => 'L',       "CCT" =>  'P',       "CAT" => 'H',       "CGT"=>  'R',   
           "CTC" => 'L',       "CCC" => 'P',       "CAC" => 'H',       "CGC" => 'R',   
           "CTA" => 'L',       "CCA" => 'P',       "CAA" => 'Q',       "CGA" => 'R',   
           "CTG" => 'L',      "CCG" => 'P',       "CAG" =>  'Q',       "CGG" => 'R',
           "ATT" => 'I',       "ACT" => 'T',       "AAT" => 'N',        "AGT" => 'S',   
           "ATC" => 'I',       "ACC" =>'T',        "AAC" => 'N',        "AGC" => 'S',   
           "ATA" => 'I',       "ACA" => 'T',       "AAA" =>  'K',       "AGA" => 'R',   
           "ATG" => 'M',       "ACG" => 'T',       "AAG" =>  'K',       "AGG" => 'R', 
           "GTT" => 'V',       "GCT"=>  'A',       "GAT" => 'D',       "GGT" =>  'G',   
           "GTC" => 'V',       "GCC" => 'A',       "GAC" => 'D',       "GGC" => 'G',   
           "GTA"  => 'V',      "GCA" => 'A',       "GAA" => 'E',       "GGA" => 'G',   
           "GTG" => 'V',       "GCG" => 'A',       "GAG" => 'E',       "GGG" => 'G',   }
           
codeTwo = { "AGA" => '*', "AGG" => '*', "ATA" => 'M', "TGA" => 'W' }

codeThree = {"ATA" => 'M',"CTT" => 'T',"CTC"  => 'T',"CTA" => 'T',"CTG" => 'T',"TGA" => 'W'
  }     

codeFour = {"TGA" => 'W'}

codeFive = {"AGA" => 'S', "AGG" => 'S', "ATA" => 'M', "TGA" => 'W'}

codeSix = { "TAA" => 'Q', "TAG" => 'Q'}

#Code Seven and Eight have been deleted

codeNine = {"AAA" => 'N', "AGA" => 'S', "AGG" => 'S', "TGA" => 'W'}

codeTen = {"TGA" => 'C'}

#Code eleven is the same as the standard code

#Code twelve is the same as standard code

codeThirteen = { "AGA" => 'G', "AGG" => 'G', "ATA" => 'M', "TGA" => 'W'}

codeFourteen = {"AAA" => 'N', "AGA" => 'S', "AGG" => 'S', "TAA" => 'Y', "TGA" => 'W' }

codeFifteen = {"TAG" => 'Q'}

puts "Please enter a string"

str = gets.chomp()

arr = str.scan(/.{3}/)

puts "enter the corresponding protein code "

proteinarray = Array.new
proteincode = gets.chomp()
proteincode.split

for i in 0..(proteincode.length)
  temp = proteincode[i]
  proteinarray.push(temp)
end

bcodeOne = 0
bcodeTwo = 0
bcodeThree = 0
bcodeFour = 0
bcodeFive = 0
bcodeSix = 0
bcodeNine = 0
bcodeTen = 0
bcodeThirteen = 0
bcodeFourteen = 0
bcodeFifteen = 0

i = 0
while i < arr.length
  key = arr[i]
  code = proteinarray[i]
  puts key
  puts code
  if codeOne[key] == code
    bcodeOne +=1
  end  
  if  codeTwo[key] == code
    bcodeTwo +=1
  end
  if codeThree[key] == code
    bcodeThree +=1
  end
  if  codeFour[key] == code
    bcodeFour +=1
  end
  if codeFive[key] == code
    bcodeFive +=1
  end
  if  codeSix[key] == code
    bcodeSix +=1
  end
  if codeNine[key] == code
    bcodeNine +=1
  end
  if codeTen[key] == code
    bcodeTen +=1
  end
  if codeThirteen[key] == code
    bcodeThirteen +=1
  end
  if  codeFifteen[key] == code
    bcodeFifteen +=1
 end
 i+=1
end


print "codeOne matches = "
puts bcodeOne

print "codeTwo matches = "
puts bcodeTwo

print "codeThree matches = "
puts bcodeThree

print "codeFour matches = "
puts bcodeFour

print "codeFive matches = "
puts bcodeFive

print "codeSix matches = "
puts bcodeSix

print "codeNine matches = "
puts bcodeNine

print "codeTen matches = "
puts bcodeTen

print "codeThirteen matches = "
puts bcodeThirteen

print "codeFourteen matches = "
puts bcodeFourteen

print "codeFifteen matches = "
puts bcodeFifteen













