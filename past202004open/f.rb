# 第二回 アルゴリズム実技検定 過去問 F - タスクの消化
# https://atcoder.jp/contests/past202004-open/tasks/past202004_f

# TLE
# https://atcoder.jp/contests/past202004-open/submissions/12821146

n = gets.chomp.to_i
ab_s = Array.new(n) { gets.chomp.split.map(&:to_i) }

tasks = ab_s.sort_by(&:last).reverse
schedule = Array.new(n) { nil }

tasks.each do |task|
  if schedule[task.first - 1].nil?
    schedule[task.first - 1] = task
  else
    day_index = task.first - 1
    while !schedule[day_index].nil?
      day_index += 1
    end
    schedule[day_index] = task
  end
end

results = []
schedule.each do |task|
  if results.empty?
    results << task.last
  else
    results << results.last + task.last
  end
end

results.each do |result|
  puts result
end
