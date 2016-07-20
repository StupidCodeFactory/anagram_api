class Anagram

  def self.for(anagrams)
    words = anagrams.split(',')

    words.inject(Hash.new) do |processed_words, word|
      processed_words[word] = db.anagrams_for(word)
      processed_words
    end
  end

  def self.db
    @db ||= WordDB.new ENV.fetch('DICT_FILE_PATH', nil)
  end
end
