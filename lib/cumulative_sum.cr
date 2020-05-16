macro define_cumulative_calculation_class(name, begin_with, operator)
  class {{name}}(T)
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

    def calc(&block) : Array(T)
      result = [] of T
      result.push({{begin_with}})

      array.each do |i|
        result.push(yield(result.last, i))
      end

      result
    end

    def calc : Array(T)
      {% if operator == :+ %}
        calc do |last, i|
          last + i
        end
      {% elsif operator == :* %}
        calc do |last, i|
          last * i
        end
      {% else %}
        raise "ArgumentError: operator is not valid."
      {% end %}
    end
  end
end

define_cumulative_calculation_class(CumulativeSum, 0, :+)
define_cumulative_calculation_class(CumulativeProduct, 1, :*)
