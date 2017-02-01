 puts "enter something"
 string = gets.chomp()
 
 
 string = string.split("")
 permutations = Hash.new
 s = string.length
 
 for i in 0..string.length-1
   permutations[i] = string 
   string = string.rotate(-1)
 end
 
# Source for ordering -> http://stackoverflow.com/questions/28557389/sorting-in-lexicographical-order
 permutations = permutations.sort { |k,v| k[1] <=> v[1]}
 hello = permutations.map {|value| value[-1][-1]}

 print hello.join("")