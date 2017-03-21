gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'

class LinkedListTest < MiniTest::Test
  def test_linked_list_is_created
    list = LinkedList.new
    assert_equal list.class.to_s, "LinkedList"
  end

  def test_head_is_nil
    list = LinkedList.new
    assert_equal list.head, nil
  end

  def test_can_append_new_node
    list = LinkedList.new
    list.append("doop")
    assert_equal list.head.data, "doop"
  end

  def test_next_node_is_nil_after_append
    list = LinkedList.new
    list.append("doop")
    assert_equal list.head.next_node, nil
  end

  def test_count_after_append_is_1
    list = LinkedList.new
    list.append("doop")
    assert_equal list.count, 1
  end
end