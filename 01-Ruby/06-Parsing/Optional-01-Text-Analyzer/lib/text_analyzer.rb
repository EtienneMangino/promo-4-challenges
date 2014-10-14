def analyze(text)
  # TODO: should analyze the text, and return the result hash with all features
  character_count = text.split('').size
  line_count = text.split("\n").size
  word_count = text.gsub(/[^\w\s]/, "").split(" ").size
  sentence_count = text.split(/[.!?;]/).size
  paragraph_count = text.split(/\n{2}/).size
  { character_count: character_count, line_count: line_count,
    word_count: word_count, sentence_count: sentence_count, paragraph_count: paragraph_count,
    average_words_per_sentence: word_count / (sentence_count == 0 ? 1 : sentence_count),
    average_sentences_per_paragraph: sentence_count / (paragraph_count == 0 ? 1 : paragraph_count) }
end

