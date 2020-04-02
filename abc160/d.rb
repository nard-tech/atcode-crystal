# ABC 160 D - Line++
# https://atcoder.jp/contests/abc160/tasks/abc160_d

n, x, y = gets.chomp.split(/ /).map(&:to_i)

module WarshallFloyd
  class Undirected
    def initialize(n)
      @n = n
      @array = 1.upto(n).map { |i| i.times.map { Float::INFINITY } }

      # puts @array.inspect

      (1..n).each do |i|
        set_distance(i, i, 0)
      end

      # puts @array.inspect

      (1..(n - 1)).each do |from|
        to = from + 1
        set_distance(from, to, 1)
      end

      # puts @array.inspect
    end

    attr_reader :array, :n

    def execute
      for k in 1..n
        for from in 1..n
          for to in from..n
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

warshall_floyd = WarshallFloyd::Undirected.new(n)
warshall_floyd.instance_eval do
  set_distance(x, y, 1)
end

a_flatten = warshall_floyd.execute.array.flatten
h = a_flatten.group_by { |i| i }

1.upto(n - 1) do |i|
  v = h[i]
  if v
    puts v.length
  else
    puts 0
  end
end
