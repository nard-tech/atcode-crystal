macro define_cumulative_calculation_class(class_name, first_element, operator_for_calc, operator_for_between)
  class {{class_name}}(T)
    def self.generate(array : Array(T), &block)
      new(array) do |last, i|
        yield(last, i)
      end
    end

    def self.generate(array : Array(T))
      new(array)
    end

    def initialize(@array : Array(T), &block)
      @result = calc(@array) do |last, i|
        yield(last, i)
      end
    end

    def initialize(@array : Array(T))
      @result = calc(@array)
    end

    getter :array
    getter result : Array(T)

    def between(i : Int32 | Int64, j : Int32 | Int64, &block)
      raise "ArgumentError: The second argument should be larger than the first argument." unless i <= j
      j_th = @result[j + 1]
      i_th = @result[i]
      yield(i_th, j_th)
    end

    def between(i : Int32 | Int64, j : Int32 | Int64)
      between(i, j) do |i_th, j_th|
        {% if operator_for_between == :- %}
          j_th - i_th
        {% elsif operator_for_between == :// %}
          j_th // i_th
        {% else %}
          raise "ArgumentError: operator is not valid."
        {% end %}
      end
    end

    private def calc(a : Array(T), &block) : Array(T)
      result = [] of T
      result.push(T.new({{first_element}}))

      a.each do |i|
        result.push(yield(result.last, i))
      end

      result
    end

    private def calc(a : Array(T)) : Array(T)
      {% if operator_for_calc == :+ %}
        calc(a) do |last, i|
          last + i
        end
      {% elsif operator_for_calc == :* %}
        calc(a) do |last, i|
          last * i
        end
      {% else %}
        raise "ArgumentError: operator is not valid."
      {% end %}
    end
  end
end

define_cumulative_calculation_class(CumulativeSum, 0, :+, :-)
define_cumulative_calculation_class(CumulativeProduct, 1, :*, ://)
