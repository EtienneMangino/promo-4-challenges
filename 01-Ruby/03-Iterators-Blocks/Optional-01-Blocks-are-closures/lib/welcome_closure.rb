
count = 0
welcome_block = Proc.new do |name|
  # TODO: your code goes here !
  count += 1
  if count == 1
    "Welcome #{name}, you are the first here!"
  elsif count == 2
    "Welcome #{name}, join your 1 friend"
  else
    "Welcome #{name}, join your #{count - 1} friends"
  end

end

puts welcome_block.call("felix")
puts welcome_block.call("estelle")
puts welcome_block.call("cedric")
puts welcome_block.call("fred")
