# ABC 167 D - Teleporter
#  https://atcoder.jp/contests/abc167/tasks/abc167_d

# AC
# https://atcoder.jp/contests/abc167/submissions/13072697

n, k = read_line.split.map(&.to_i64)
a = read_line.split.map(&.to_i64)

class Teleporation
  def self.build(a : Array(Int64))
    teleportation = [] of Int64

    current_town = 1
    next_town = a[current_town - 1]
    stop_at = nil

    h = Hash(Int64, Bool).new { false }
    while !h[next_town]
      # puts "#{current_town} -> #{next_town}"
      teleportation.push(next_town)
      h[next_town] = true

      current_town = next_town
      next_town = a[current_town - 1]
      if current_town == next_town
        stop_at = current_town
        break
      end
    end

    i = teleportation.index(next_town)
    if i.nil? || i == 0
      appendix = [] of Int64
      circulated = teleportation
    else
      appendix = teleportation[0..(i - 1)]
      circulated = teleportation[i..-1]
    end

    new(appendix, circulated, stop_at)
  end

  def initialize(@appendix : Array(Int64), @circulated : Array(Int64), @stop_at : Int64 | Nil)
  end

  getter :appendix, :circulated, :stop_at

  def get(k : Int64)
    return appendix[k - 1] if k <= appendix.size

    k -= appendix.size

    return circulated[k - 1] if k <= circulated.size
    return stop_at unless stop_at.nil?

    n = k % circulated.size
    circulated[n - 1]
  end
end

teleportation = Teleporation.build(a)
# puts teleportation.inspect
puts teleportation.get(k)
