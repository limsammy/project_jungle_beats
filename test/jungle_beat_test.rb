gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/jungle_beat'

class JungleBeatTest < Minitest::Test
  def test_jungle_beat_instance_is_list
    jb = JungleBeat.new
    assert_equal jb.list.class.to_s, "LinkedList"
  end

  def test_head_is_nil
    jb = JungleBeat.new
    assert_equal jb.list.head, nil
  end

  def test_adds_elements_to_seperate_nodes
    jb = JungleBeat.new
    jb.append("deep doo ditt")
    assert_equal 3, jb.list.count
    assert_equal jb.list.head.data, "deep"
    assert_equal jb.list.head.next_node.data, "doo"
    assert_equal jb.list.head.next_node.next_node.data, "ditt"
  end
end