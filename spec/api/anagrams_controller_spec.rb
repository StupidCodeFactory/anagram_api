require "rails_helper"

RSpec.describe AnagramsController, type: :request do

  let(:url)       { "/#{word}" }
  let(:word)      { 'beta' }
  let(:anagrams)  { { 'beta' => ['abet', 'beat'] } }

  describe 'API behaviour' do
    before do
      expect(Anagram).to receive(:for).with(word).and_return(anagrams)
      get url
    end

    it 'accepts a word' do
      expect(JSON.parse(response.body)).to eq(anagrams)
    end

  end
end
