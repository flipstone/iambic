module Iambic
  class Pronounciation
    attr_reader :string

    def initialize(string)
      @string = string
    end

    def to_stress_pattern
      StressPattern.new stresses
    end

    def ==(other)
      self.class == other.class &&
      string == other.string
    end

    def to_s
      @string
    end

    private

    def stresses
      @string.scan(/[012]/).map do |stress|
        if stress == "1"
          H
        else
          L
        end
      end
    end
  end
end

