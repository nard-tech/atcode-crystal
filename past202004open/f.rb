# 第二回 アルゴリズム実技検定 過去問 F - タスクの消化
# https://atcoder.jp/contests/past202004-open/tasks/past202004_f

# TLE
# https://atcoder.jp/contests/past202004-open/submissions/12821343

n = gets.chomp.to_i
ab_s = Array.new(n) { gets.chomp.split.map(&:to_i) }

tasks = ab_s.sort_by(&:last).reverse
schedule = (0..(n - 1)).to_a

tasks.each do |task|
  day_index = schedule.find { |task_of_day| task_of_day.is_a?(Integer) && task_of_day >= task.first - 1 }
  schedule[day_index] = task
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
