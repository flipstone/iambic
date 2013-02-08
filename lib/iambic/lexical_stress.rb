module Iambic
  class LexicalStress
    include Enumerable

    attr_reader :work

    def initialize(stresses, word)
      @stresses = stresses
      @word = word
    end

    def each
      @stresses.each { |s| yield s }
    end
  end
end
