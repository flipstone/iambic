module Iambic
  class LexicalItem
    attr_reader :word, :pronounciation

    def initialize(word, pronounciation)
      @word = word
      @pronounciation = pronounciation
    end

    def ==(other)
      self.class == other.class &&
      word == other.word &&
      pronounciation == other.pronounciation
    end
  end
end
