#Subroutine longest_common_substr acquired from http://stackoverflow.com/questions/2158313/finding-common-string-in-array-of-strings-ruby

def longest_common_substr(strings)
  shortest = strings.min_by &:length
  maxlen = shortest.length
  maxlen.downto(0) do |len|
    0.upto(maxlen - len) do |start|
      substr = shortest[start,len]
      return substr if strings.all?{|str| str.include? substr }
    end
  end
end

first_time = true
countingarray = Array.new
totalstring = ""

f = File.open('testfile.txt', 'r')
  f.each_line do |line|
   if (line[/^>/]) && (!first_time)
     totalstring = totalstring.gsub(/\s+/,"")
     countingarray.push(totalstring)   
     totalstring = ""
    end
     if (!line[/^>/])
     appendingstring = line
     totalstring << appendingstring
     first_time = false
     end
   end
     totalstring = totalstring.gsub(/\s+/,"")
     countingarray.push(totalstring)   
     totalstring = ""
 
 puts longest_common_substr(countingarray)    
     
     
        
     
     