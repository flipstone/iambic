module Iambic
  class StressPattern
    attr_reader :stresses

    def initialize(stresses)
      @stresses = stresses
    end

    def find_violator(patterns)
      return nil if patterns.empty?

      if rest = try_partial_matches(patterns.first.stress_patterns)
        rest.find_violator patterns.drop(1)
      else
        patterns.first
      end
    end

    def try_partial_matches(patterns)
      patterns.each do |p|
        if rest = partial_match(p)
          return rest
        end
      end

      nil
    end

    def partial_match(pattern)
      others = pattern.stresses

      if stresses.take(others.length) == others
        self.class.new stresses.drop others.length
      end
    end

    def to_stress_pattern
      self
    end

    def to_s
      "<StressPattern #{@stresses.join(',')}>"
    end

    def ==(other)
      self.class == other.class &&
      stresses == other.stresses
    end
  end
end
