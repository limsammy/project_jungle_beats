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
    current = @head
    count = 0
    until current.next_node == nil
      current = current.next_node
      count += 1
    end
    count
  end

  def to_string
  end
end

binding.pry