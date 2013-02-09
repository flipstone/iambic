module Iambic
  class Dictionary
    def initialize(source)
      @lines = source.each_line.to_a
    end

    def [](word)
      key = Regexp.quote(word.sub(/'S$/, 'S')).sub(/S$/,"'?S")
      regex = /^#{key} ( \(\d+\) )? \s/x

      search_range(word).grep(regex).map do |line|
        line.split(/\s+/,2).last.strip
      end
    end

    private

    def search_range(word)
      range = index[word[0..1]] || {}
      Subrange.new @lines, range[:start], range[:end]
    end


    def index
      @index ||= begin
        idx = {}

        @lines.each_with_index do |line, i|
          key = line[0..1]
          idx[key] ||= { start: i }
          idx[key][:end] = i
        end

        idx
      end
    end

    class Subrange
      include Enumerable

      def initialize(source, r_start, r_end)
        @source = source
        @r_start = r_start
        @r_end = r_end
      end

      def each
        return unless @r_start

        @r_start.upto @r_end do |i|
          yield @source[i]
        end
      end
    end

    def self.load_cmu
      File.open File.join(File.dirname(__FILE__), 'cmudict.0.7a.txt') do |io|
        new io
      end
    end
  end
end

