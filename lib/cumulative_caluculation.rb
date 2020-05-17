# frozen_string_literal: true

# 累積和，累積積の計算を行うための抽象クラス
class CumulativeCalculation
  def self.generate(array, &block)
    block = block_given? ? block : nil
    new(array, block)
  end

  def initialize(array, first_element, operator_for_calc, operator_for_between, block)
    unless %i[+ *].include?(operator_for_calc)
      raise ArgumentError, 'operator_for_calc is not valid.'
    end

    unless %i[- /].include?(operator_for_between)
      raise ArgumentError, 'operator_for_between is not valid.'
    end

    @array = array
    @first_element = first_element
    @operator_for_calc = operator_for_calc
    @operator_for_between = operator_for_between
    @result = calc(array, block)
  end

  attr_reader :array
  attr_reader :first_element, :operator_for_calc, :operator_for_between
  attr_reader :result

  def between(i, j)
    unless i <= j
      raise ArgumentError, 'The second argument should be larger than the first argument.'
    end

    j_th = result[j + 1]
    i_th = result[i]

    if block_given?
      yield(i_th, j_th)
    else
      j_th.send(operator_for_between, i_th)
    end
  end

  private

  def calc(array, block)
    result = []
    result.push(first_element)

    array.each do |i|
      result.push(next_element(result.last, i, block))
    end

    result
  end

  def next_element(last, i, block)
    if block.nil?
      last.send(operator_for_calc, i)
    else
      block.call(last, i)
    end
  end
end

# 累積和の計算を行うためのクラス
class CumulativeSum < CumulativeCalculation
  def initialize(array, block)
    super(array, 0, :+, :-, block)
  end
end

# 累積積の計算を行うためのクラス
class CumulativeProduct < CumulativeCalculation
  def initialize(array, block)
    super(array, 1, :*, :/, block)
  end
end
