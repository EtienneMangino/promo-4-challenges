# Very dirty code to make some dirty gym...
def hop_hop_hop(number_of_exercises)
  (1..number_of_exercises).each do |x|
    print 'hop! ' * x + 'One more time..' + "\n"
  end
end

hop_hop_hop(6)
