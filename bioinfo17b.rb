require 'trie'

trie = Trie.new


trie.add("ATAGA")
trie.add("ATC")
trie.add("GAT")


line_num = 0
file = File.read("testfile.txt")
file.gsub(/\r\n?/, "\n")
file.each_line do |line|
string = line
trie.add(string)

string.split('').each do |char|
  
  
end
end
