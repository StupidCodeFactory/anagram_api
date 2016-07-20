class WordDB

  DEFAULT_DF_FILE = '/usr/share/dict/words'.freeze

  def initialize(word_db_file_path = DEFAULT_DF_FILE)
    self.word_db_file_path = word_db_file_path
    self.index             = Hash.new { |hash, key| hash[key] = [] }
  end

  def index!
    File.foreach(word_db_file_path) do |line|

      word = line.chomp.downcase
      key  = index_key_for(word)

      next if index[key].include?(word)

      index[key] << word
    end
  end

  def anagrams_for(word)
    index[index_key_for(word.downcase)]
  end


  private

  attr_accessor :word_db_file_path, :index

  def index_key_for(word)
    word.chars.sort.join
  end
end
