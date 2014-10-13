def most_common_words(file_name, stop_words_file_name, number_of_word)
  # TODO: return hash of occurences of number_of_word most frequent words
  word = Hash.new(0)
  resultat = {}

  File.open(file_name, "r").each_line do |line|
    line.gsub(/\n/, "").scan(/\w+/).each { |x| word[x.downcase] += 1 }
  end

  File.open(stop_words_file_name, "r").each_line do |line|
    line.gsub(/\n/, "").scan(/\w+/).each { |x| word[x] = 0 }
  end

  theword = ""
  while number_of_word > 0
    word.each { |k, v| theword = k if v == word.values.max }
    resultat[theword] = word.values.max
    word[theword] = 0
    number_of_word -= 1
  end

  resultat
end

most_common_words("lib/source-text.txt", "lib/stop_words.txt",4)

