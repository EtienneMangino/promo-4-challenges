def anagrams?(a_string, another_string)
  #TODO: implement the obvious method to test if two words are anagrams
  a_string.gsub!(/[\W_]/,'')
  another_string.gsub!(/[\W_]/,'')
  a_string.downcase.chars.sort.join == another_string.downcase.chars.sort.join
end

def anagrams_on_steroids?(a_string, another_string)
  #TODO: implement the improved method
  hash = {
    text1: a_string.gsub(/[\W_]/,''),
    text2: another_string.gsub(/[\W_]/,'')
  }
  hash[:text1].downcase.chars.sort.join == hash[:text2].downcase.chars.sort.join
end

