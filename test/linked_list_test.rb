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
end