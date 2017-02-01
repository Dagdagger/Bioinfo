file = File.open("testfile.txt", "rb")
input = file.read
input = input.gsub(/\s+/,"")

puts input


def kmpPreprocess(p)

b = Array.new
m = p.length
i = 0
j = -1

b[i] = j

while i < m
  while (j>=0 && (p[i] != p[j]))
    j = b[j]
  end
    i+=1
    j+=1
    b[i] = j
end
return b
end


hello = kmpPreprocess(input)


output = File.open("newfile.txt","w")
output << hello
output.close