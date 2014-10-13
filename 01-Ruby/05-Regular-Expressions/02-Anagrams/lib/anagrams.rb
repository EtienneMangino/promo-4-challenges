def anagrams?(a_string, another_string)
  # TODO: implement the obvious method to test if two words are anagrams
  a_string.gsub!(/[\W_]/, '')
  another_string.gsub!(/[\W_]/, '')
  a_string.downcase.chars.sort.join == another_string.downcase.chars.sort.join
end

def anagrams_on_steroids?(a_string, another_string)
  # TODO: implement the improved method
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  a_string.gsub(/[\W_]/, '').downcase.scan(/\w/).each { |x| hash1[x] += 1 }
  another_string.gsub(/[\W_]/, '').downcase.scan(/\w/).each { |x| hash2[x] += 1 }

  hash1 == hash2
end

