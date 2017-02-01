require 'open-uri'

matcharray = Array.new

filetwo = File.open("newfile.txt", 'r')

filetwo.each_line do |line|

string = line.gsub(/\s+/,"")
matcharray.clear

firstmatch = false
secondmatch = false
thirdmatch = false

download = open("http://www.uniprot.org/uniprot/#{string}.fasta")
IO.copy_stream(download, 'testfile.txt')

file = File.open("testfile.txt", "rb")
file.gets.chomp()
input = file.read
input = input.gsub(/\s+/,"")
match = false

for i in 0..input.length
  temp = input[i]
  if temp == 'N'
      for x in i+1..i+3
        temptwo = input[x]   
       
       
        if (x == i+1) && (temptwo != 'P')
          firstmatch = true
        else if (x == i+1)
        firstmatch = false
        end
        end
      
      
        if (x == i+2) && (temptwo == 'S' || temptwo == 'T') && (firstmatch)
          secondmatch = true
        else if (x == i+2)
          secondmatch = false
        end
        end
        
        
        
        if (x == i+3) && (temptwo != 'P') && (firstmatch) && (secondmatch)
          thirdmatch = true
        else if (x == i+3)
          thirdmatch = false
      end
      end
      end
    if (firstmatch) && (secondmatch) && (thirdmatch)
      matcharray.push(i+1)
    end
  end
end

if(!matcharray.empty?)
puts line
puts matcharray.join(" ")
end
end