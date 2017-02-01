puts "what is k(length of pattern)?"
k = gets.chomp().to_i

puts "what is L(length of characters if pattern fits)?"
l = gets.chomp().to_i

puts "what is t(times it has to appear)?"
t = gets.chomp().to_i

puts "Okay now put in the Array"
str = gets.chomp()
x = str.length
str.split
array = Array.new
deletion = false

for i in 0..(str.length)
  temp = str[i]
  array.push(temp)
end

stringarray = Array.new
storagearray = Array.new
mainstorage = Array.new
dopearray = Array.new

a = 0
while (a+k) < array.length
    for i in a..a+k-1
      temp = array[i]
      stringarray.push(temp)    # push the elements from the original array into string array
    end
    
stringarraystring = stringarray.join("")                #turn into string
ogarraystring = array.join("")                          #make array into string to be able to use scan method

b = ogarraystring.scan(stringarraystring).length
#puts b
if b >= t                                     # if it has occurred enough times and not already included, it's added to the list of potential costumers
  storagearray.insert(a, stringarraystring)
 end 
  if !mainstorage.include?(stringarraystring) && b >= t
  mainstorage.push(stringarraystring)
end
stringarray.clear
a+=1
end


for i in 0..mainstorage.length - 1
        dope = mainstorage[i]
        dopearray = storagearray.each_index.select{|f| storagearray[f] == dope}
        for y in 0..(dopearray.length-t-1)
          if (dopearray[y+t-1] - dopearray[y]) <= l
            deletion = false
            break
          else deletion = true
            end
         if deletion == true
           mainstorage.delete_at(i)
         end        
        end
     end
          
=begin        
        firstindex = storagearray.index(dope)
        lastindex = storagearray.rindex(dope)
        
  if (lastindex != nil) && (firstindex != nil) && (lastindex - firstindex) > l + 40
    mainstorage.delete_at(i)
  end
 end
=end
print mainstorage.join(" ")