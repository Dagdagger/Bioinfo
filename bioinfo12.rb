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

puts "Enter a String"
string = gets.chomp()
start = false

reverseComplement = string.dup


for i in 0..reverseComplement.length
  if reverseComplement[i] == 'A'
    reverseComplement[i] = 'T'
    next
    end
    if reverseComplement[i] == 'G'
    reverseComplement[i] = 'C'
    next
    end
    if reverseComplement[i] == 'C'
    reverseComplement[i] = 'G'
    next
    end
    if reverseComplement[i] == 'T'
    reverseComplement[i] = 'A'
    next
    end
end

reverseComplement.reverse!

puts ""

def rna(codearray, thestring, thehash)
  startarray = codearray.each_index.select{|f| codearray[f] == 'ATG'}
stoparray = codearray.each_index.select{|f| codearray[f] == 'TAA' || codearray[f] == 'TGA' || codearray[f] == 'TAG'}

a = 0
i = 0

while i < startarray.length
  indexOne = startarray[i]
  indexTwo = stoparray[a]
  
  if (indexOne != nil) && (indexTwo != nil) && (indexOne < indexTwo)
    for b in indexOne..indexTwo-1
      key = codearray[b]
      print thehash[key]
    end
    puts ""
    i+=1
    next
  end
=begin 
  if (indexTwo == nil) && (indexOne != nil)
    for b in indexOne..codearray.length
      key = codearray[b]
      print thehash[key]
    end
    puts ""
  end
=end
  
  if (indexOne != nil) && (indexTwo != nil) && (indexOne > indexTwo)
    a+=1
    next
  end
  i+=1
end
end
  
  
  
DNA = string.scan(/.{3}/)



startarray = DNA.each_index.select{|f| DNA[f] == 'ATG'}
stoparray = DNA.each_index.select{|f| DNA[f] == 'TAA' || DNA[f] == 'TGA' || DNA[f] == 'TAG'}


i = 0
a = 0
while i < startarray.length
  indexOne = startarray[i]
  indexTwo = stoparray[a]
  
  if (indexOne != nil) && (indexTwo != nil) && (indexOne < indexTwo)
    for b in indexOne..indexTwo-1
      key = DNA[b]
      print codeOne[key]
    end
    i+=1
    puts ""
    next
  end

=begin   
   if (indexTwo == nil) && (indexOne != nil)
    for b in indexOne..DNA.length
      key = DNA[b]
      print codeOne[key]
    end
    puts ""
  end
=end
  if (indexOne != nil) && (indexTwo != nil) && (indexOne > indexTwo)
    a+=1
    next
  end
  i+=1
end


string.slice!(0)

secondRead = string.scan(/.{3}/)
rna(secondRead, string, codeOne)
#puts"pass two"



string.slice!(0)
thirdRead = string.scan(/.{3}/)
rna(thirdRead, string, codeOne)
#puts"pass three"


fourthRead = reverseComplement.scan(/.{3}/)
rna(fourthRead, reverseComplement, codeOne)
#puts"pass four"

reverseComplement.slice!(0)


fifthRead = reverseComplement.scan(/.{3}/)
rna(fifthRead, reverseComplement,codeOne)
#puts"pass five"

reverseComplement.slice!(0)

sixthRead = reverseComplement.scan(/.{3}/)
rna(sixthRead, reverseComplement,codeOne)
#puts"pass six"
