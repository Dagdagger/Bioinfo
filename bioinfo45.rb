
number = IO.readlines("goodbye.txt")[0]
dna = IO.readlines("goodbye.txt")[1]
prob = IO.readlines("goodbye.txt")[2]


number = number.to_i
number = number - dna.length + 2
prob_array = prob.split(" ")


gc_count = dna.count("GC")
at_count = dna.count("AT")

class Float

def probability(gc, at)
  hello = (self/2)
  bye = ((1-self)/2)
  hello = hello**gc
  bye = bye**at
  hellobye = hello*bye
  return hellobye
end
end

prob_array = prob_array.flatten.collect{ |i| i.to_f }

print prob_array

puts ""

newarray = prob_array.map{ |x| x.probability(gc_count, at_count)*number }

newarray = newarray.map{|x| x.round(3)}

print newarray.join(" ")
