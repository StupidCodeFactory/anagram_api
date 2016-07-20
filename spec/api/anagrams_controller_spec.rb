require "rails_helper"

RSpec.describe AnagramsController, type: :request do

  let(:url)           { "/#{CGI.escape(word_or_words)}" }
  let(:word_or_words) { 'beta' }
  let(:api_response)  { JSON.parse response.body }

  describe 'API behaviour' do

    it 'accepts a word' do
      get url
      expect(api_response).to eq({ 'beta' => ['beat', 'abet']})
    end

    it 'accepts a comma separated words'

    context 'with a non existing word' do
      it 'returns a 404'
    end

    context 'with an existing word' do
      context 'without anagrams' do
        it 'returns an empty array'
      end

      context 'with anagrams' do
        it 'returns an array containing all possible anagrams'

        describe 'when passing a word containing non alpha-numeric characters' do
          it 'strips the non alpha-numeric characters out'
        end

      end
    end
  end
end
