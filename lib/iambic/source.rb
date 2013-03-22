module Iambic
  class Source
    def initialize(s, line_number = 1)
      @s = s
      @line_number = line_number
    end

    def line_number
      @line_number
    end

    def to_s
      @s
    end

    def each_line
      @s.each_line.map.with_index do |line, idx|
        Source.new line, @line_number + idx
      end
    end

    def split(*args)
      @s.split(*args).map { |s| Source.new s, @line_number }
    end

    def empty?
      @s.empty?
    end

    def upcase
      Source.new @s.upcase, @line_number
    end

    def ==(other)
      self.class == other.class &&
      line_number == other.line_number &&
      to_s == other.to_s
    end
  end
end
