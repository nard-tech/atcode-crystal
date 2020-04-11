# 第一回 アルゴリズム実技検定 過去問 E - SNS のログ / Restore
# https://atcoder.jp/contests/past201912-open/tasks/past201912_e

n, q = read_line.split.map(&.to_i64)
s = Array.new(q) { read_line.split.map(&.to_i64) }

class Query
  def initialize(array : Array(Int64))
    if array.size == 3
      @query_type, @follower_id, @followee_id = array
    else
      @query_type, @follower_id = array
      @followee_id = -1_i64
    end

    @follower_id -= 1_i64
    @followee_id -= 1_i64 unless @followee_id == -1_i64
  end

  property query_type : Int64
  property follower_id : Int64
  property followee_id : Int64

  def exec(matrix : Array(Array(Int32)))
    # puts "----"
    if @query_type == 1
      matrix[follower_id][followee_id] = 1
      # puts "(1) #{follower_id} follows #{followee_id}"
    elsif @query_type == 2
      matrix.each_with_index do |row, user_id|
        next if user_id == follower_id
        matrix[follower_id][user_id] = 1 if row[follower_id] == 1
        # puts "(2) #{follower_id} follows #{user_id}"
      end
    else
      # matrix.each do |row|
      #   puts row.map { |cell| cell == 0 ? "N" : "Y" }.join(" ")
      # end

      queue = [] of Array(Int64 | Int32)

      # puts "for follower #{follower_id}"
      matrix[follower_id].each_with_index do |cell, followee_id|
        next if followee_id == follower_id
        next if cell == 0

        # puts "  for #{followee_id}"
        matrix[followee_id].each_with_index do |cell2, followee_of_followee_id|
          next if cell2 == 0
          queue.push([follower_id, followee_of_followee_id])
        end
      end

      queue.each do |v|
        follower_id, followee_of_followee_id = v
        matrix[follower_id][followee_of_followee_id] = 1
      end
    end
  end
end

queries = s.map { |a| Query.new(a) }
matrix = Array.new(n) { Array.new(n) { 0 } }

queries.each do |query|
  query.exec(matrix)
end

matrix.each do |row|
  puts row.map { |cell| cell == 0 ? "N" : "Y" }.join("")
end
