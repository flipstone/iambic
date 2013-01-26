module Iambic
  class Dictionary
    def initialize(source)
      @lines = source.each_line.to_a
    end

    def [](word)
      regex = /^#{Regexp.quote(word)} ( \(\d+\) )? \s/x

      @lines.grep(regex).map do |line|
        line.split(/\s+/,2).last.strip
      end
    end

    def self.load_cmu
      File.open File.join(File.dirname(__FILE__), 'cmudict.0.7a.txt') do |io|
        new io
      end
    end
  end
end

