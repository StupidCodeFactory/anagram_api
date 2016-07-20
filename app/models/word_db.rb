class WordDB

  DEFAULT_DB_FILE = '/usr/share/dict/words'.freeze

  def initialize(word_db_file_path)
    self.word_db_file_path = word_db_file_path || DEFAULT_DB_FILE
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
    word.downcase!
    index[index_key_for(word.downcase)] - [word]
  end


  private

  attr_accessor :word_db_file_path, :index

  def index_key_for(word)
    word.chars.sort.join
  end
end
