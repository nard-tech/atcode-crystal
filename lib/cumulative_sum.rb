class CumulativeCalculation
  def self.calc(array, &block)
    new(array).calc(&block)
  end

  def initialize(array, begin_with, operator)
    @array = array
    @begin_with = begin_with
    @operator = operator
  end

  attr_reader :array, :begin_with, :operator

  class << self
    private :new
  end

  def calc
    cumulative_sums = []
    cumulative_sums.push(begin_with)

    if block_given?
      array.each do |i|
        cumulative_sums.push(yield(cumulative_sums.last, i))
      end
    else
      array.each do |i|
        cumulative_sums.push(cumulative_sums.last.send(operator, i))
      end
    end

    cumulative_sums
  end
end

class CumulativeSum < CumulativeCalculation
  def initialize(array)
    super(array, 0, :+)
  end
end

class CumulativeProduct < CumulativeCalculation
  def initialize(array)
    super(array, 1, :*)
  end
end
