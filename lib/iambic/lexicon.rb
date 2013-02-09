module Iambic
  class Lexicon
    def initialize(dictionary)
      @dictionary = dictionary
    end

    def [](word)
      definitions = @dictionary[word.dictionary_key]
      pronounciations = definitions.map do |pronounciation_spec|
        Pronounciation.new pronounciation_spec
      end

      LexicalItem.new word, pronounciations
    end

    def lex(phrase)
      phrase.map do |word|
        item = self[word]

        if item.pronounciations.empty?
          Missing.new word
        else
          item
        end
      end
    end

    Missing = Struct.new :word
  end
end

