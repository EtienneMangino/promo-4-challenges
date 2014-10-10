def array_to_hash(array)
  #TODO: implement the method :)
hash = {}

array.each_with_index { |x,i| hash[block_given? ? yield(i) : i]=x }
hash
end



p array_to_hash(["a","b","c"])