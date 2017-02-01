class Node
  attr_accessor :value, :first_node, :second_node, :third_node, :fourth_node, :edge_value_one, :edge_value_two, :edge_value_three, :edge_value_four, :number_of_edges, :inclusionArray, :level


def initialize(value, first_node, edge_value_one, number_of_edges, level)  
 @value = value
 @edge_value = edge_value_one
 @next_node = first_node
 @number_of_edges = number_of_edges
 @level = level
 @first_node = nil
 @second_node = nil
 @third_node = nil
 @fourth_node = nil
 @edge_value_one = ""
 @edge_value_two = ""
 @edge_value_three = ""
 @edge_value_four = ""
 @inclusionArray = Array.new
 
end

def contains(dna)
  return self.inclusionArray.include?(dna)
end

def nextNode(num)
  if num == 0
    return self.first_node
  end  
  if num == 1
    return self.second_node
  end
  if num == 2
    return self.third_node
  end
  if num == 3
    return self.fourth_node
end
end

def nextValue(num)
  if num == 0
    return edge_value_one
  end
  if num == 1
    return edge_value_two
  end
  if num == 2
   return edge_value_three
  end
  if num == 3
   return edge_value_four
   end
 end
  
        
def display_value
  puts value
end
end
#end of node class


Root = Node.new 0, nil, "", 0, 0


line_num = 0
file = File.read("testfile.txt")

node_nums = 1

file.each_line do |line|
string = line
string = string.gsub(/\s+/,"")
puts string



for i in 0..string.length-1
  temp = string[i]
  puts temp 
  if temp == nil
    next
  end
  currentNode = Root
  traverselevel = 0
  while traverselevel < i+1
     if  currentNode != nil && currentNode.contains(temp)
         num = currentNode.inclusionArray.index(temp)
         currentNode =  currentNode.nextNode(num)
         traverselevel+=1
         #puts traverselevel
         next
       end
    if currentNode != nil && !currentNode.contains(temp)
      currentNode.inclusionArray.push(temp)
      edgeNumber = currentNode.number_of_edges
     if edgeNumber == 0
       node_nums+=1
       newNode = Node.new node_nums, nil, nil, 0, traverselevel
       currentNode.first_node = newNode
       currentNode.number_of_edges+=1
       traverselevel+=1
       #puts traverselevel
       print "My value is "
       newNode.display_value
     end
     if edgeNumber == 1
       node_nums+=1
       newNode = Node.new node_nums, nil, nil, 0, traverselevel
       currentNode.second_node = newNode
       currentNode.number_of_edges+=1
       traverselevel+=1
       #puts traverselevel
       print "My value is "
       newNode.display_value
     end
     if edgeNumber == 2
       node_nums+=1
       newNode = Node.new node_nums, nil, nil, 0, traverselevel
       currentNode.third_node = newNode
       currentNode.number_of_edges+=1
       traverselevel+=1
       #puts traverselevel
       print "My value is "
       newNode.display_value
     end
     if edgeNumber == 3
       node_nums+=1
       newNode = Node.new node_nums, nil, nil, 0, traverselevel
       currentNode.fourth_node = newNode
       currentNode.number_of_edges+=1
       traverselevel+=1
       #puts traverselevel
       print "My value is "
       newNode.display_value
     end
     end
     traverselevel+=1
     puts "herllo"
     puts traverselevel
   end
 end
end
       
      
      
      
         
    
    
    
    
    
    
    
    
    
    
=begin    
    
    if Root.number_of_edges == 0
      newNode = Node.new 1, nil, nil, 0
      Root.first_node = newNode
      Root.edge_value_one = temp
      Root.number_of_edges = 1
      node_nums+= 1
      next
    end
    if Root.number_of_edges == 1 && temp != Root.edge_value_one
       newNode = Node.new node_nums, nil, nil, 0
       Root.second_node = node_nums
       Root.edge_value_two = temp
       Root.number_of_edges = 2
       node_nums+= 1
       next        
    end
     if Root.number_of_edges == 2 && temp != Root.edge_value_two
       newNode = Node.new node_nums, nil, nil, 0
       Root.second_node = newNode
       Root.edge_value_three = temp
       Root.number_of_edges = 3
       node_nums+= 1
       next        
    end
     if Root.number_of_edges == 3 && temp != Root.edge_value_three
       newNode = Node.new node_nums, nil, nil, 0
       Root.fourth_node = newNode
       Root.edge_value_four = temp
       Root.number_of_edges = 4
       node_nums+= 1
       next       
    end
    
    
    
  end
end
end
=end


