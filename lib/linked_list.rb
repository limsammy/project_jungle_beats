require_relative 'node'
require 'pry'

class LinkedList < Node
  attr_reader :head

  attr_accessor :data

  def initialize
    @head = nil
  end

  def append(data)
    @head = Node.new(data)
  end

  def count
    current_node = @head
    count = 1
    until current_node.next_node == nil
      current_node = current.next_node
      count += 1
    end
    count
  end

  def to_string
  end
end

binding.pry