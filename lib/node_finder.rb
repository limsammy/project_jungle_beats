require_relative 'node'

class NodeFinder
  attr_reader :head

  def initialize(head, pos, num_elements=1)
    @head = head
    @pos = pos
    @num_elements = num_elements
  end

  def self.locate(head, pos, num_elements)
    new(head, pos).locate
  end

  def locate
    current_node = @head
    count = 0
    until count == @pos
      count += 1
      current_node = current_node.next_node
    end
    found = ''
    count = 0
    until count == @num_elements
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
end