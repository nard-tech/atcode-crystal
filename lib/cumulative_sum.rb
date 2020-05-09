class CumulativeSum
  def self.calc(array, &block)
    new(array).calc(&block)
  end

  def initialize(array)
    @array = array
  end

  attr_reader :array

  def calc
    cumulative_sums = []
    cumulative_sums.push(0)

    if block_given?
      array.each do |i|
        cumulative_sums.push(yield(cumulative_sums.last, i))
      end
    else
      array.each do |i|
        cumulative_sums.push(cumulative_sums.last + i)
      end
    end

    cumulative_sums
  end
end
