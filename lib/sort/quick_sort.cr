# メモリ消費量が多い (1100540 KB)
def quick_sort(a)
  return a if a.size <= 1
  base = a.pop
  smaller, bigger = a.partition { |e| e < base }
  a.push(base)
  quick_sort(smaller) + [base] + quick_sort(bigger)
end
