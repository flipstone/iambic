module Iambic
  class Sample
    attr_reader :text

    def self.find(name)
      new File.read sample_base.join("#{name}.txt")
    rescue Errno::ENOENT
      raise SampleNotFoundError, name
    end

    def self.sample_base
      Pathname.new(__FILE__).dirname.join('samples')
    end

    def initialize(text)
      @text = text
    end

    class SampleNotFoundError < StandardError; end
  end
end
