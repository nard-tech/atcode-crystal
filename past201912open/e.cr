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

  private def follow?(matrix : Array(Array(Int32)), from : Int64, to : Int64)
    matrix[from][to] == 1
  end

  private def follow(matrix : Array(Array(Int32)), from : Int64, to : Int64)
    matrix[from][to] = 1
    # puts "(#{query_type}) #{from} follows #{to}"
  end

  private def reverse_follow(matrix : Array(Array(Int32)))
    # inspect(matrix)
    queue = [] of Array(Int64)

    matrix.each_with_index do |row, user_id|
      next if user_id == follower_id
      next unless follow?(matrix, user_id.to_i64, follower_id.to_i64)
      queue.push([follower_id.to_i64, user_id.to_i64])
    end

    process_queue(matrix, queue)
  end

  private def follow_follow(matrix : Array(Array(Int32)))
    # inspect(matrix)

    queue = [] of Array(Int64)

    # puts "for follower #{follower_id}"
    matrix[follower_id].each_with_index do |cell, followee_id|
      next if followee_id == follower_id
      next unless follow?(matrix, follower_id.to_i64, followee_id.to_i64)

      # puts "  for #{followee_id}"
      matrix[followee_id].each_with_index do |cell2, followee_of_followee_id|
        next if followee_of_followee_id == follower_id
        next unless follow?(matrix, followee_id.to_i64, followee_of_followee_id.to_i64)
        queue.push([followee_id.to_i64, followee_of_followee_id.to_i64])
      end
    end

    process_queue(matrix, queue)
  end

  private def process_queue(matrix, queue : Array(Array(Int64)))
    queue.each do |v|
      from, to = v
      follow(matrix, from, to)
    end
  end

  private def inspect(matrix : Array(Array(Int32)))
    matrix.each do |row|
      puts row.map { |cell| cell == 0 ? "N" : "Y" }.join(" ")
    end
  end

  def exec(matrix : Array(Array(Int32)))
    # puts "----"
    if @query_type == 1
      follow(matrix, follower_id, followee_id)
    elsif @query_type == 2
      reverse_follow(matrix)
    else
      follow_follow(matrix)
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
