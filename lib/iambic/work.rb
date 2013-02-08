module Iambic
  class Work
    attr_reader :lines

    def initialize(lines)
      @lines = lines
    end

    def self.parse(source)
      new Line.parse_lines source
    end

    def map
      Work.new(
        lines.map do |line|
          line.map do |w|
            yield w
          end
        end
      )
    end

    def ==(other)
      self.class == other.class &&
      lines == other.lines
    end
  end
end
