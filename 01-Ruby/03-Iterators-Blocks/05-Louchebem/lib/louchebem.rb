# Encoding: utf-8
def split_speciaux(word)
  a = word.index(/[!,;.:!"'()-]/)
  if a != nil
    [word[0..a - 1], word[a..-1]]
  else
    [word, 0]
  end
end

def louchebemize(sentence)
  # TODO: implement your louchebem translator
  tab_sentence = sentence.split(" ")
  tab_vowel = %w(a e i o u y)
  tab_suffix = %w(em é ji oc ic uche ès)


  tab_sentence.map! do |x|
    split = split_speciaux(x)
    if x.size == 1 || (split[0].size == 1)
      x
    elsif tab_vowel.include?(x[0])
      if split[1] != 0
        "l" + split[0] + tab_suffix.sample + split[1]
      else
        "l" + x + tab_suffix.sample
      end
    else
      if split[1] != 0
        a = split[0].split("")
        first_vowel = a.find_index { |y| tab_vowel.include?(y) }
        a.rotate!(first_vowel)
        "l" + a.reduce(:+) + tab_suffix.sample +  split[1]
      else
        a = x.split("")
        first_vowel = a.find_index { |y| tab_vowel.include?(y) }
        a.rotate!(first_vowel)
        "l" + a.reduce(:+) + tab_suffix.sample
      end
    end
  end

  final = tab_sentence.map! { |x| x + " "}.reduce(:+)
  final[0..-2]
end

puts louchebemize("Chat, fou!!")
