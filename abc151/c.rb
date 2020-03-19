# ABC 151 C - Welcome to AtCoder
# https://atcoder.jp/contests/abc151/tasks/abc151_c

n, m = gets.split.map(&:to_i)
ps_array = Array.new(m) { p, s = gets.split; [p.to_i, s] }

groups = {}

ps_array.each do |ps|
  p, s = ps
  if groups[p]
    groups[p].push(s)
  else
    groups[p] = [s]
  end
end

# puts groups

def process_answers(answers, acs, was)
  answers.each do |answer|
    if answer == "WA"
      was += 1
    elsif answer == "AC"
      acs += 1
      return acs, was
    end
  end

  return acs, was
end

acs = 0
was = 0

groups.each do |problem, answers|
  acs, was = process_answers(answers, acs, was)
end

puts "#{acs} #{was}"
