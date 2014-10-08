def sum_with_while(min, max)
  # CONSTRAINT: you should use a while..end structure
  a = min
  sum = min

  while a != max
    a += 1
    sum += a
  end

  sum
end

puts sum_with_while(2, 5)


def sum_with_for(min, max)
  # CONSTRAINT: you should use a for..end structure
  sum = 0
  for a in min..max
    sum += a
  end

  sum
end

puts sum_with_for(2, 5)

def sum_recursive(min, max)
  # CONSTRAINT: you should use a recursive algorithm, i.e. the method should call itself
  fail ArgumentError if min > max
  return max if min == max
  min + sum_recursive(min + 1, max)
end

puts sum_recursive(2, 5)

