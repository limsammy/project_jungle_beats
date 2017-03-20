require './lib/node'
require 'pry'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    new_node = Node.new(data)
  end
end

list = LinkedList.new
binding.pry