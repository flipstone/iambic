module Iambic
  class Command
    attr_reader :args, :stdin, :stdout

    def initialize(args, stdin, stdout)
      @args = args
      @stdin = stdin
      @stdout = stdout
    end

    def self.run(*args)
      new(*args).run
    end

    def run
      raise "#{self.class}#run needs to be implemented"
    end

    private

    def puts(*args)
      stdout.puts *args
    end
  end
end
