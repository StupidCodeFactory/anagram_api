class Anagram

  class WordNotFound < ArgumentError;  end

  def self.for(anagrams)
    words = anagrams.split(',')

    words.inject(Hash.new) do |processed_words, word|
      processed_words[word] = WordDB.anagrams_for(word)
      processed_words
    end
  end

end
