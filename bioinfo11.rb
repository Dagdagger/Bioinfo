codeOne = { "A" =>  71.03711,
"C" => 103.00919,
"D" =>  115.02694,
"E" =>  129.04259,
"F" =>  147.06841,
"G" => 57.02146,
"H" =>  137.05891,
"I" =>  113.08406,
"K" =>  128.09496,
"L" =>  113.08406,
"M" =>  131.04049,
"N" =>  114.04293,
"P" =>  97.05276,
"Q" => 128.05858,
"R" =>  156.10111,
"S" =>  87.03203,
"T" =>  101.04768,
"V" =>  99.06841,
"W" =>  186.07931,
"Y" =>  163.06333,
}


counter = 0.0;
arr = Array.new
puts "Enter the String"
str = gets.chomp()
str.split

for i in 0..(str.length)
  temp = str[i]
  arr.push(temp)
end

for i in 0..(arr.length)
  key = arr[i]
  temp = codeOne[key]
  if temp == nil
    next
  end
  counter = temp + counter 
end
print counter
