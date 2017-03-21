require_relative 'node'
require 'pry'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    if head.nil?
      @head = Node.new(data)
    else
      get_current_node(data)
    end
  end

  def prepend(data)
    if head.nil?
      @head = Node.new(data)
    else
      head_to_move = @head
      @head = Node.new(data)
      @head.next_node = head_to_move
    end
  end

  def insert(pos, data)
    if pos > count
      puts "List has only #{count} items."
    else
      current_node = @head
      count = 1
      until count == pos
        current_node = current_node.next_node
        count += 1
      end
      insert_node = Node.new(data)
      insert_node.next_node = current_node.next_node
      current_node.next_node = insert_node
    end
  end

  def count
    current_node = @head
    count = 1
    until current_node.next_node.nil?
      current_node = current_node.next_node
      count += 1
    end
    count
  end

  def to_string
    elements = ""
    elements << @head.data
    current_node = @head.next_node
    until current_node.nil?
      elements << " " + current_node.data
      current_node = current_node.next_node
    end
    elements
  end

  def find(pos, num_elements)
    current_node = @head
    count = 0
    until count == pos
      count += 1
      current_node = current_node.next_node
    end
    create_found(num_elements, current_node)
  end

  def create_found(num_elements, current_node)
    found = ''
    count = 0
    until count == num_elements
      if current_node.nil?
        break
      end
      count += 1
      found << current_node.data + ' '
      current_node = current_node.next_node
    end
    found
  end

  def get_current_node(data)
    current_node = @head
    until current_node.next_node.nil?
      current_node = current_node.next_node
    end
    current_node.next_node = Node.new(data)
  end
end

# binding.pry