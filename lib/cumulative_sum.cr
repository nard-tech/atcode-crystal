class CumulativeSum(T)
  def self.calc(array : Array(T)) : Array(T)
    new(array).calc
  end

  def self.calc(array : Array(T), &block) : Array(T)
    new(array).calc do |last, i|
      yield(last, i)
    end
  end

  def initialize(@array : Array(T))
  end

  getter :array

  def calc : Array(T)
    cumulative_sums = [] of T
    cumulative_sums.push(0)

    array.each do |i|
      cumulative_sums.push(cumulative_sums.last + i)
    end

    cumulative_sums
  end

  def calc(&block) : Array(T)
    cumulative_sums = [] of T
    cumulative_sums.push(0)

    array.each do |i|
      cumulative_sums.push(yield(cumulative_sums.last, i))
    end

    cumulative_sums
  end
end
