module Iambic
  class LexicalItem
    attr_reader :word, :pronounciation

    def initialize(word, pronounciation)
      @word = word
      @pronounciation = pronounciation
    end

    def to_stress_pattern
      pronounciation.to_stress_pattern
    end

    def to_s
      "#{word.string} (#{pronounciation})"
    end

    def ==(other)
      self.class == other.class &&
      word == other.word &&
      pronounciation == other.pronounciation
    end
  end
end
