require_relative 'linked_list'

class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
    @rate = 500
    @voice = "Boing"
  end

  def append(data)
    data.split(" ").each do |element|
      list.append(element)
    end
  end

  def count
    list.count
  end

  def play
    `say -r #{@rate} -v #{@voice} #{list.to_string}`
  end
end