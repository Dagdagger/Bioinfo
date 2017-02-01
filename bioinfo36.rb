file = File.open('newfile.txt')

contents = file.read()

hello = contents.chomp()

puts hello
