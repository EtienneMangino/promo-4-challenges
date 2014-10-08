def pmu_format!(race_array)
  # TODO: modify the given array so that it is PMU-consistent. This method should return nil.
  race_array.reverse!
  a = race_array.size + 1
  race_array.map! do |x|
    a -= 1
    "#{a}-#{x}!"
  end
  race_array
end

puts pmu_format!(%w(Alain Bob Dri Paul))



