module Iambic
  class Word
    attr_reader :string

    def initialize(string)
      @string = string.upcase
    end

    def self.[](*words)
      words.map { |w| new w }
    end

    def self.parse_words(line)
      self[*line.split(/(?:[^a-z0-9'])+/i).reject(&:empty?)]
    end

    def ==(other)
      self.class == other.class &&
      string == other.string
    end

    def to_s
      "Word(#{string.inspect})"
    end

    def dictionary_key
      string
    end
  end
end
