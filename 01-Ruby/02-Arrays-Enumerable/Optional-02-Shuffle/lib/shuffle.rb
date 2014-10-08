def shuffle(array)
  # TODO: shuffle the array manually
  # 100.times do
  #   a = array[0]
  #   b = rand(array.size)
  #   array[0]= array[b]
  #   array[b]= a
  # end
  array.sort_by { rand }
end
