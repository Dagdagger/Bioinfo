string = "ACGT"
array = Array.new
kaymer = Array.new(256, 0)

for i in 0..string.length-1
  temp = string[i]
  array.push(temp)
end


hello = array.repeated_permutation(4).map(&:join)

file = File.open("testfile.txt", "rb")

input = file.read
input = input.gsub(/\s+/,"")



dnacode = input.scan(/.{4}/)


for i in 0..hello.length-1
  temp = hello[i]
  number =  dnacode.count(temp)
  kaymer[i] = kaymer[i] + number
end

input.slice!(0)

dnacode = input.scan(/.{4}/)


for i in 0..hello.length-1
  temp = hello[i]
  number =  dnacode.count(temp)
  kaymer[i] = kaymer[i] + number
end

input.slice!(0)

dnacode = input.scan(/.{4}/)


for i in 0..hello.length-1
  temp = hello[i]
  number =  dnacode.count(temp)
  kaymer[i] = kaymer[i] + number
end

input.slice!(0)

dnacode = input.scan(/.{4}/)


for i in 0..hello.length-1
  temp = hello[i]
  number =  dnacode.count(temp)
  kaymer[i] = kaymer[i] + number
end


print kaymer

