require_relative 'node'
require_relative 'node_finder'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    if head.nil?
      @head = Node.new(data)
    else
      tail.next_node = Node.new(data)
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
    while current_node.next_node
      current_node = current_node.next_node
      count += 1
    end
    count
  end

  def to_string
    elements = ""
    elements << @head.data
    current_node = @head.next_node
    while current_node
      elements << " " + current_node.data
      current_node = current_node.next_node
    end
    elements
  end

  def find(pos, num_elements)
    NodeFinder.locate(@head, pos, num_elements)
  end

  def includes?(element)
    current_node = @head

    until current_node.nil?
      return true if current_node.data == element
      current_node = current_node.next_node
    end
  end

  def pop
    if @head.nil?
      puts "Nothing to pop!"
    elsif @head.next_node.nil?
      last_element = @head.data
      @head = nil
      last_element
    else
      remove_last_element
    end
  end

  def tail
    current_node = @head
    until current_node.next_node.nil?
      current_node = current_node.next_node
    end
    current_node
  end

  def remove_last_element
    current_node = @head
    until current_node.next_node.next_node.nil?
      current_node = current_node.next_node
    end
    last_element = current_node.next_node.data
    current_node.next_node = nil
    last_element
  end
end
