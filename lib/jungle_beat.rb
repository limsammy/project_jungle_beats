require_relative 'linked_list'
require 'pry'

class JungleBeat
  attr_reader :list
  attr_accessor :rate, :voice

  def initialize(rate=500, voice="Boing")
    @list = LinkedList.new
    @rate = rate
    @voice = voice
  end

  def append(data)
    data.split(" ").each do |element|
      list.append(element)
    end
  end

  def valid?(element)
    valid = []
    Dir.chdir(File.dirname(__FILE__))
    valid_words = File.open("valid.txt", "r")
    valid << valid_words.read.split(" ")
    if valid[0].include?(element)
      true
    else
      false
    end
  end

  def count
    list.count
  end

  def play
    `say -r #{@rate} -v #{@voice} #{list.to_string}`
  end

  def all
    list.to_string
  end
end