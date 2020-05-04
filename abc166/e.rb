# ABC 166 E - This Message Will Self-Destruct in 5s
# https://atcoder.jp/contests/abc166/tasks/abc166_e

# TLE
# https://atcoder.jp/contests/abc166/submissions/12768938

n = gets.chomp.to_i
a = gets.chomp.split(/ /).map(&:to_i)

h = Hash.new
a.each.with_index(1) do |height, i|
  h[height] ||= []
  h[height].push(i)
end

# puts h.inspect

count = 0

h.keys.sort.each do |height|
  ids = h[height]
  h.each do |k, ids_of_another_height|
    next if k < height

    sum = height + k
    ids_of_another_height.each do |id_of_another_height|
      ids.each do |id|
        if sum == (id - id_of_another_height).abs && !(k == height && id < id_of_another_height)
          # puts "id: #{id} (height: #{height}), id: #{id_of_another_height} (height: #{k}), abs of diff: #{(id - id_of_another_height).abs}, sum: #{sum}"
          count += 1
        end
      end
    end
  end
end

puts count
