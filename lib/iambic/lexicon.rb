module Iambic
  class Lexicon
    def initialize(dictionary)
      @dictionary = dictionary
    end

    def [](word)
      @dictionary[word.dictionary_key].map do |pronounciation_spec|
        LexicalItem.new word,
                        Pronounciation.new(pronounciation_spec)
      end
    end

    def lex(phrase)
      phrase.map do |word|
        self[word].first || Missing.new(word)
      end
    end

    Missing = Struct.new :word
  end
end

