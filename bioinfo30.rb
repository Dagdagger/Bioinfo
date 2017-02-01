require 'levenshtein'

puts "enter string one"

string = gets.chomp()

puts "enter string two"

stringtwo = gets.chomp()

puts Levenshtein.distance(string, stringtwo)
