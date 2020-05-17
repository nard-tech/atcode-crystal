module WarshallFloyd
  class Undirected
    def initialize(n)
      @n = n
      @array = 1.upto(n).map { |i| i.times.map { Float::INFINITY } }

      (1..n).each do |i|
        set_distance(i, i, 0)
      end

      (1..(n - 1)).each do |from|
        to = from + 1
        set_distance(from, to, 1)
      end
    end

    attr_reader :array, :n

    def execute
      (1..n).each do |k|
        (1..n).each do |from|
          (from..n).each do |to|
            # puts "#{from} -> #{to} : #{distance(from, to).inspect}"
            new_distance = [
              distance(from, to),
              distance(from, k) + distance(k, to)
            ].min
            set_distance(from, to, new_distance)
          end
        end
      end

      self
    end

    private

    def distance(from, to)
      if from <= to
        @array[to - 1][from - 1]
      else
        @array[from - 1][to - 1]
      end
    end

    def set_distance(from, to, distance)
      @array[to - 1][from - 1] = distance
    end
  end
end
