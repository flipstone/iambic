module Iambic
  class LexicalItem
    attr_reader :word, :pronounciations

    def initialize(word, pronounciations)
      @word = word
      @pronounciations = pronounciations
    end

    def stress_patterns
      pronounciations.map &:to_stress_pattern
    end

    def string
      word.string
    end

    def to_s
      "#{string} (#{pronounciations.join(', ')})"
    end

    def ==(other)
      self.class == other.class &&
      word == other.word &&
      pronounciations == other.pronounciations
    end
  end
end
