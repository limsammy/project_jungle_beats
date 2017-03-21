gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test
  def test_node_is_created
    node = Node.new("plop")
    assert_equal node.class.to_s, "Node"
    assert_equal "plop", node.data
  end

  def test_next_node_returns_nil
    node = Node.new("no next node")
    assert_equal nil, node.next_node
  end
end