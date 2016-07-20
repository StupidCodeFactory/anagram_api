require "rails_helper"

RSpec.describe WordDB do
  let(:db_file_with_dups) { Rails.root.join('spec', 'fixtures', 'word_db.txt').to_s }

  subject { described_class.new(db_file_with_dups) }

  describe '#index!' do

    it 'loads the given file' do
      expect(File).to receive(:foreach).with(db_file_with_dups)
      subject.index!
    end

    it 'index does not include twice the same word' do
      subject.index!
      expect(subject.anagrams_for('beta')).to eq(["abet", "beat", "beta"])
    end

  end

  describe '::anagram_for' do
    before do
      subject.index!
    end

    it 'has indexed words correctly' do
      expect(subject.anagrams_for('beta')).to eq(["abet", "beat", "beta"])
    end

    it 'search is case insensitive' do
      expect(subject.anagrams_for('BETA')).to eq(["abet", "beat", "beta"])
    end

  end
end
