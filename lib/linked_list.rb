require_relative 'node'
require 'pry'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def tail
    go_to_last_node
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
    generate_found(num_elements, current_node)
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

  def generate_found(num_elements, current_node)
    found = ''
    count = 0
    until count == num_elements
      if current_node.nil?
        break
      else
        count += 1
        found << current_node.data + ' '
        current_node = current_node.next_node
      end
    end
    found.strip
  end

  def get_current_node(data)
    go_to_last_node.next_node = Node.new(data)
  end

  def go_to_last_node
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
    new_last_element = current_node.next_node.data
    current_node.next_node = nil
    new_last_element
  end
end

# binding.pry