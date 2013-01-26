module Iambic
  class Line
    attr_reader :words

    def initialize(words)
      @words = words
    end

    def self.parse_lines(lines)
      lines.each_line.map { |l| new Word.parse_words l }
    end

    def ==(other)
      self.class == other.class &&
      words == other.words
    end
  end
end
