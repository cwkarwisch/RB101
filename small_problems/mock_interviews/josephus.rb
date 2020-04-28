class Node
  attr_accessor :value, :pointer

  def initialize(value, next_node)
    @value = value
    @pointer = next_node
  end
end

def create_x_nodes(number)
  return nil if number < 1
  counter = 0
  head_node = Node.new(counter, nil)
  head_node.pointer = head_node
  counter += 1
  previous_node = head_node
  while counter < number
    current_node = Node.new(counter, head_node)
    previous_node.pointer = current_node
    previous_node = current_node
    counter += 1
  end
  head_node
end

def next_node(current_node, steps = 1)
  steps.times {current_node = current_node.pointer}
  current_node
end

def delete_next_node(current_node)
  current_node.pointer = current_node.pointer.pointer
end

def josephus_survivor(number_of_people, frequency)
  head = create_x_nodes(number_of_people)
  current = head
  until current.pointer == current
    current = next_node(current, frequency - 1)
    delete_next_node(current)
  end
  current.value
end

survivor = josephus_survivor(3, 3)
puts survivor

=begin
head_node = Node.new(0, nil)
head_node.pointer = head_node

second_node = Node.new(1, head_node)
head_node.pointer = second_node

third_node = Node.new(2, head_node)
second_node.pointer = third_node

puts head_node
puts head_node.pointer
puts second_node
puts second_node.pointer
puts third_node
puts third_node.pointer
=end


# need to make this circular - making circulat will break how push works and make part of
# delete_by_value unnevcessary/broken
# need to be able to create x number of new nodes (or do that within josephus itself?)
# need to control for any situation where we might delete the head node and make sure we
# move the head to the next one

=begin
class CircularLinkedList

  attr_accessor :current_node

  def initialize(value)
    @head = Node.new(value, nil)
    @head.pointer = @head.object_id
    # @current_node = @head
  end

  def push(value)
    current_node = @head
    until current_node.pointer.nil?
      current_node = current_node.pointer
    end
    current_node.pointer = Node.new(value, nil)
  end

  def delete_by_value(value)
    current_node = @head
    if current_node.value == value
      @head = current_node.pointer
    else
      while current_node.pointer != nil && current_node.pointer.value != value
        current_node = current_node.pointer
      end
      current_node.pointer = current_node.pointer.pointer
    end
  end

  def next_node(steps = 1)
    steps.times {@current_node = @current_node.pointer}
  end

  def delete_next_node
    current_node.pointer = current_node.pointer.pointer
  end

end

list = CircularLinkedList.new(0)
list.push(1)
list.push(2)
list.push(3)
#p list.current_node
#puts
#list.next_node(2)
#p list.current_node

=end
