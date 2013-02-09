module Iambic
  class Meter
    def initialize(stress_pattern)
      @stress_pattern = stress_pattern
    end

    def violations(work, lexicon)
      lexed = lexicon.lex work

      lexed.lines.map do |line|
        violator = @stress_pattern.find_violator line.words
        Violation.new violator, line if violator
      end.compact
    end
  end
end
