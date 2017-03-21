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
end