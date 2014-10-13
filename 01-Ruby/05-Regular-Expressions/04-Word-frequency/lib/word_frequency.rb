def most_common_words(file_name, stop_words_file_name, number_of_word)
  # TODO: return hash of occurences of number_of_word most frequent words
  File.open(file_name).each_line do |line|
  # Do something with the line variable
    p line
  end


end

most_common_words("lib/source-text.txt", "stop_words.txt",4)

