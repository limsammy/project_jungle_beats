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
    assert_equal nil, jb.list.head
  end

  def test_appends_elements_to_seperate_nodes
    jb = JungleBeat.new
    jb.append("deep doo ditt")
    assert_equal 3, jb.list.count
    assert_equal "deep", jb.list.head.data
    assert_equal "doo", jb.list.head.next_node.data
    assert_equal "ditt", jb.list.head.next_node.next_node.data
  end

  def test_count
    jb = JungleBeat.new
    jb.append("deep doo ditt")
    assert_equal 3, jb.count
  end

  def test_returns_rate
    jb = JungleBeat.new
    assert_equal 500, jb.rate
  end

  def test_returns_voice
    jb = JungleBeat.new
    assert_equal "Boing", jb.voice
  end

  def test_can_set_voice
    jb = JungleBeat.new
    jb.voice="Alex"
    assert_equal "Alex", jb.voice
  end

  def test_can_set_rate
    jb = JungleBeat.new
    jb.rate=200
    assert_equal 200, jb.rate
  end
end