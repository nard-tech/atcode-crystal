def selection_sort(a)
  last_index = a.size - 1

  0.upto(last_index) do |i|
    min = a[i]
    min_index = i

    (i + 1).upto(last_index) do |j|
      if a[j] < min
        min = a[j]
        min_index = j
      end
    end

    a[i], a[min_index] = min , a[i]
  end

  a
end
