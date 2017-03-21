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

  def test_to_string_method_returns_string
    list = LinkedList.new
    list.append("doop")
    assert_equal list.to_string.class.to_s, "String"
    assert_equal list.to_string, "doop"
  end

  def test_can_append_multiple_elements
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    assert_equal "deep", list.head.next_node.data
    assert_equal 2, list.count
    assert_equal "doop deep", list.to_string
  end

  def test_can_prepend
    list = LinkedList.new
    list.append("append")
    list.prepend("prepend")
    assert_equal 2, list.count
    assert_equal "prepend", list.head.data
  end

  def test_can_insert_at_position
    list = LinkedList.new
    list.append("zero")
    list.append("one")
    list.insert(1, "one/half")
    assert_equal "zero one/half one", list.to_string
  end

  def test_can_find_at_position
    list = LinkedList.new
    list.append("0")
    list.append("1")
    list.append("2")
    assert_equal "2", list.find(2, 1)
  end

  def test_includes_returns_true
    list = LinkedList.new
    list.append("found")
    assert_equal true, list.includes?("found")
  end

  def test_pop_removes_last_element
    list = LinkedList.new
    list.append("now")
    list.append("remove")
    list.append("this")
    list.pop
    assert_equal 2, list.count
    assert_equal "now", list.head.data
  end

  def test_tail_returns_last_element
    list = LinkedList.new
    list.append("first")
    list.append("middle")
    list.append("last")
    assert_equal "last", list.tail
  end
end