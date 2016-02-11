
  require_relative 'list'

class JungleBeat

  attr_accessor :list
  attr_reader :beat

  def initialize(beat = nil)
    @beat = beat
    if @beat != nil
      @list = List.new
      @list.append(@beat)
    end
  end

  def append(beats)
    initial_count = @list.count
    @list.append(beats)
    return @list.count - initial_count
  end

  def prepend(beats)
    initial_count = @list.count
    @list.prepend(beats)
    return @list.count - initial_count
  end

  def count
    @list.count
  end

  def all
    @list.all
  end

  def pop(pops)
    result_of_pop = []
    pops.times do
      result_of_pop << @list.pop
    end
    return result_of_pop.reverse.join (" ")
  end

  def insert(start_point, data)
    if start_point > count
      return "Sorry, that is beyond the scope of the list."
    else
      @list.insert(start_point, data)
    end
    all
  end

  def find(start_point, number_of_elements)
    @list.find(start_point, number_of_elements)
  end

  def include?(data)
    @list.include?(data)
  end

  def play(rate = 500, voice = "Boing")
    @rate = rate
    @voice = voice
    `say -r #{rate} -v #{voice} #{beat}`
    count
  end


end
