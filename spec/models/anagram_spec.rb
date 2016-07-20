require "rails_helper"

RSpec.describe Anagram do

  let(:word_or_words) { 'beta' }
  let(:word_db)       { double(WordDB) }

  describe '::for' do
    before do
      expect(Anagram).to receive(:db).at_least(:once).and_return(word_db)
    end

    context 'with one word' do
      let(:anagrams) { ['abet', 'beat']  }

      before do
        expect(word_db).to receive(:anagrams_for).with(word_or_words).and_return(anagrams)
      end

      it 'returns the list of anagrams' do
        expect(described_class.for(word_or_words)).to eq(word_or_words => anagrams)
      end

      context 'with a word containing to alpha numeric charaters' do
        let(:anagrams) { [] }
        let(:word_or_words) { "b'eta" }

        it 'does not match ' do
          expect(word_db).to_not receive(:anagrams_for).with('beta')
          expect(described_class.for(word_or_words)).to eq(word_or_words => anagrams)
        end

      end
    end

    context 'with mulitple comma separated words' do
      let(:word_or_words)     { 'beta,apt' }
      let(:anagrams_for_beta) { ['abet', 'beat'] }
      let(:anagrams_for_apt)  { ['pat','tap'] }

      before do
        expect(word_db).to receive(:anagrams_for).with('beta').and_return(anagrams_for_beta)
        expect(word_db).to receive(:anagrams_for).with('apt').and_return(anagrams_for_apt)
      end

      it 'returns a list of anagrams for each words' do
        expect(described_class.for(word_or_words)).to eq('beta' => anagrams_for_beta, 'apt' => anagrams_for_apt)
      end
    end
  end

end
